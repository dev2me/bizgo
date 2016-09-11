json.type "users"
json.id @user.id
json.attributes @user.attributes
json.token @token.token
json.expires_at @token.expires_at
#json.(@user,:id,:name,:email, :provider, :nivel, :avatar)
#json.(@token,:token,:expires_at)