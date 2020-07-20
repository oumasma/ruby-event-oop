require 'pry'
require 'time'


=begin
	
Un événement est défini par une date de début, une durée, un titre, un ou plusieurs utilisateurs.
Il faut être capable de décaler un événement au lendemain, même heure.
Il faut qu'il soit possible de récupérer des informations comme :
La date de fin ;
Savoir si un événement est passé ou non ;
Savoir si un événement est dans moins de 30 minutes (au cas où nous voudrions envoyer un rappel).
Il faut que l'on soit capables d'afficher de manière présentable un événement

=end

class Event
	attr_accessor :start_date, :duration, :title, :attendees

	def initialize(event_date, duration, title, attendees)
		@start_date = Time.parse (event_date) #event a une @start_date de type Time
		@duration = duration #évent a une @duration : integer qui représente le nombre de minutes
		@title = title #string
		@attendees = attendees #1 ou plusieurs : un array qui contient une liste d’e-mails
	end

	def postpone_24h
		@start_date = @start_date +(24 * 3600)
	end

	def end_date 	
		@end_date = @start_date + @duration
	end
	
	def is_past? 
		if @start_date < Time.now
			return true
		else
			return false
		end
	end

	def is_future?
		if @start_date > Time.now
			return true
		else
			return false
		end
	end

	def is_soon?
		if @start_date < (30*60) < Time.now
			return true
		else
			return false
		end
	end

	def to_s
		puts ">Titre : #{@title}"
		puts ">Date de début : #{@start_date}"
		puts ">Durée : #{@duration}"
		puts ">Invités : #{@attendees}"
	end
end
binding.pry
puts "end of file"