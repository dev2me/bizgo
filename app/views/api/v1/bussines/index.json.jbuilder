json.array! @bussines do |bussine|
	
	json.type "bussines"
	json.id bussine.id
	json.attributes do
		json.name bussine.name
		json.description bussine.description
		json.direccion bussine.direccion
		json.telefono bussine.telefono
		#json.lat bussine.latitud
		#json.lgn bussine.longitud
		json.socio do
			json.name bussine.user.name
			json.avatar bussine.user.avatar(:thumb)
		end
	end

	
end