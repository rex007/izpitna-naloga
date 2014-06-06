class Artikli
	def initialize(id_artikla,naziv,mera,zaloga = "je")
		@id_artikla = id_artikla.to_i
		@naziv = naziv
		@mera = mera.to_i
		@zaloga = zaloga
	end

	def pregled
		puts "\t\t#{@id_artikla}: Naziv: #{@naziv}, kolicina: #{@mera}/kos, zaloga:#{@zaloga}"
	end

	def preverjanje_artikla(iskani_artikel)
		ok = false
		ok = true if @naziv.include?(iskani_artikel)
	end

	def dodaj_kolicino(kolicina)
		@mera += kolicina
	end

	def izdaj_kolicino(kolicina)
		@mera -= kolicina
		if @mera <= 0
			@zaloga = "ni" 
			@mera = 0
		end
	end

	def izbrani_artikli(kolicina)
		ok = false
		ok = true if @mera < kolicina
	end
end