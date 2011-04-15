# coding: utf-8
1.upto(10) {|n|
Contact.create(:name => "user#{n}", :email => "ramtiga@+#{}@gmail.com", :subject => "タイトル#{n}", :body => "ほんぶん#{n}")
}
