require_relative 'artikli.rb'

def vpis_artiklov(zaloga)
	id_artikla = 1
	(zaloga.size).times { id_artikla += 1}
	print "Vpisite naziv artikla: "
	naziv = gets.chomp
	if naziv != ''
		print "kolicina: "
		kolicina = gets.chomp.to_i
		zaloga << Artikli.new(id_artikla,naziv,kolicina)
	end
end

def pregled_zalog(zaloga)
	zaloga.each do |z| 
		z.pregled
	end
end

def pregled_manjse_kolicine_od_navedene(zaloga)
	print "Vnesite kolicino: "
	kolicina = gets.chomp.to_i
	zaloga.each do |z|
		z.pregled if z.izbrani_artikli(kolicina)
	end
end

def nabava(zaloga)
	pregled_zalog(zaloga)
	print "Vnesite ime artikla: "
	artikel = gets.chomp
	print "vnesite kolicino: "
	kolicina = gets.chomp.to_i
	zaloga.each do |z|
		pregled_zalog(zaloga) if z.preverjanje_artikla(artikel)
		z.dodaj_kolicino(kolicina) if z.preverjanje_artikla(artikel)
	end
end

def izdaja(zaloga)
	pregled_zalog(zaloga)
	print "Vnesite ime artikla: "
	artikel = gets.chomp
	print "vnesite kolicino: "
	kolicina = gets.chomp.to_i
	zaloga.each do |z|
		pregled_zalog(zaloga) if z.preverjanje_artikla(artikel)
		z.izdaj_kolicino(kolicina) if z.preverjanje_artikla(artikel)
	end
end

zaloga = []
ok = true
while ok
	ok = false if !vpis_artiklov(zaloga)
end

while true
	puts "\n\n\t\t\tEkonomat\n\n"
	print "\t\tIzberi:\t(1) -- Nabava\n\t\t\t(2) -- Izdaja\n\t\t\t(3) -- Pregled zalog\n\t\t\t(4) -- Izhod\nVnos: "
	izbira = gets.chomp.to_i
	case izbira
	when 1; nabava(zaloga)
	when 2;izdaja(zaloga)
	when 3; pregled_manjse_kolicine_od_navedene(zaloga)
	when 4;break
	end
end