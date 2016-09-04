json.array! @bussines do |bussine|
	json.id bussine.id
	json.name bussine.name
	json.description bussine.description
	json.direccion bussine.direccion
	json.telefono bussine.telefono

	json.socio do
		json.name bussine.user.name
	end
end