# SSH ProxyJump via Bastion

Ce repo contient un exemple de configuration SSH pour se connecter à un serveur cible via un bastion (serveur de rebond).

## Configuration

À placer dans `~/.ssh/config` :

```ssh
Host bastion               
    HostName ip_address_of_bastion  
    IdentityFile ~/.ssh/id_rsa      
    User user_name

Host server_target        
    ProxyJump bastion      
    HostName ip_address_of_server_target  
    IdentityFile ~/.ssh/id_rsa           
    User user_name
   ```                    

