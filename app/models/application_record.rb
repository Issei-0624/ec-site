class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  #ActiveRecord::Base を継承したクラスを作成し、さらにそのクラスを継承させたい場合に self.abstract_class = true が必要。
  #参考：https://codaholic.org/?p=2214
end
