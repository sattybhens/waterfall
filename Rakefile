
desc "simplehttpserver"
task :server do 
 system 'python "-m SimpleHTPServer 8888"'
end

desc "compile coffeescript application"
task :coffee do 
 system 'coffee -o app/js/ -w app/coffee/'
end

desc "compile coffeescript specs"
task :spec do 
 system 'coffee -o app/spec/ -w app/spec/'
end

