# Ruby Script to control deployment to different environments

system("del C:\\web\\repos\\jeremymorgan\\*.*")
system("xcopy /S C:\\web\\octogen\\jeremymorgan\\public\\*.* C:\\web\\repos\\jeremymorgan")
system ("cd C:\\web\\repos\\jeremymorgan\\")

ourarg= ARGV[0]

case ourarg

when 'appfog'
	#system("af update jeremymorgan --path=C:\\web\\repos\\jeremymorgan")
	system("af update jeremymorgan --path=C:\\web\\repos\\jeremymorgan")
	
when 'azure'
	system ("git push jeremymorganazure master")

when 'ironfoundry'
	puts "you chose iron foundry"
	
else
	puts "you chose nothing"
end

