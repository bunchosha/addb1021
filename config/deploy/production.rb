set :stage, :production
set :rails_env, 'production'
server '54.65.219.227', user: 'maki1121', 
roles: %w{web app db} 

set :ssh_options, {

}

set :ssh_options, {
    keys: %w(~/.ssh/id_rsa_ec2),
    auth_methods: %w(publickey)
 #   keys: [File.expand_path('~/.ssh/adbd1021.pem)')]    
  }