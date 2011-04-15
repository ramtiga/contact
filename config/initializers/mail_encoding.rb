# encoding: utf-8
require 'mail'
Mail::UnstructuredField.module_eval do
  def encode_with_fix(value)
    encode_without_fix(value.encode(charset))
  end
  alias_method_chain :encode, :fix
end

Mail::Message.module_eval do
  def charset=(value)
    @defaulted_charset = false
    @charset = value
    @header.charset = value
    @body.charset   = value
  end
end

Mail::Body.module_eval do
  def encoded_with_fix(transfer_encoding = '8bit')
    dec = Mail::Encodings::get_encoding(encoding)
    if multipart? ||  transfer_encoding == encoding and dec.nil?
      encoded_without_fix(transfer_encoding)
    else
      enc = Mail::Encodings::get_encoding(get_best_encoding(transfer_encoding))
      enc.encode(dec.decode(raw_source).encode(charset))
    end
  end
  alias_method_chain :encoded, :fix
end

