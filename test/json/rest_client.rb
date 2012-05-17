

class ArubaServiceTest

end

RestClient.post "https://localhost:3000/api/v1/account/events?auth_token=zqp6EDzfHd2UkkQdcxxB", 
	{event: {name: "Apple Keynote", description: "Présentation du nouvel Ipad", 
		from: "2012-03-03 13:00:00", to: "2012-03-03 15:00:00", note: "Eteindre vos portables Svp", price: 400}}

RestClient.post "https://localhost:3000/api/v1/account/events?auth_token=zqp6EDzfHd2UkkQdcxxB", {event: {name: "Microsoft Conf", description: "Présentation de WP7", from: "2012-04-03 13:00:00", to: "2012-03-03 15:00:00", note: "Eteindre vos portables Svp", price: 200}}

RestClient.put "https://localhost:3000/api/v1/account/events/4f7e0964b809231b8b0000d1.json?auth_token=zqp6EDzfHd2UkkQdcxxB", 
	{event: {name: "Apple Keynote (updated)"}}

RestClient.delete "https://localhost:3000/api/v1/account/events/4f7e0c57b809231b8b000103.json?auth_token=zqp6EDzfHd2UkkQdcxxB"

# {
# 	"user": {
# 		name: "Apple Keynote", description: "Présentation du nouvel Ipad", from: "2012-03-03 13:00:00", to: "2012-03-03 15:00:00", note: "Eteindre vos portables", price: "400.00"
# 	}
# }