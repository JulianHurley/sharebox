class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

	has_many :assets

	has_attached_file :uploaded_file, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
#  	validates_attachment_content_type :uploaded_file, content_type: /\Aimage\/.*\Z/

  	validates_attachment_size :uploaded_file, less_than: 10.megabytes
#  	validates_attachment_presence :uploaded_file, if :uploaded_file

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true

end
