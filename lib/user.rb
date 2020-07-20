require 'pry'

class User #On crée une classe User
	attr_accessor :email, :age 
	@@all_users = Array.new 

	def initialize(email_to_save, age_to_save)
		@email = email_to_save  
		@age = age_to_save
		@@all_users << self  #ajoute au tableau (dimension augmente à chaque fois) l'objet self (lui-même)
	end

	def self.all
		return self
	end

	def self.find_by_email(email)
		@@all_users.select{|x|x.email == email}
	end
	
end

=begin
	
 on veut pouvoir créer un utilisateur, lui attribuer un e-mail et un âge, puis obtenir facilement la liste des utilisateurs.
Un User a 2 variables d'instance, un @email (string) et un @age (Integer), que l'on peut lire et modifier à sa guise (indice : attr_accessor).
Dès la création d'un User, on veut définir son e-mail et son âge. En d'autres terme, on veut pouvoir faire julie = User.new("julie@email.com", 32)
Il est possible de récupérer un array contenant tous les utilisateurs déjà créés. Cela doit se faire via une méthode de classe de la façon suivante : User.all.
va voir la partie sur les variables de classe
1) Il faut que tu crées une variable de classe @@all_users qui est un array.
2) Puis, à chaque création d'utilisateur (dans le "initialize"), tu rajoutes le nouvel utilisateur dans cet array (utilise "self" pour faire référence à l'objet créé dans le initialize).
3) Pour finir, il faut coder une méthode de classe "self.all" qui retourne simplement @@all_users.
	
=end