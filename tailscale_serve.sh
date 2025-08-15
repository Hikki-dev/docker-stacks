#!/bin/bash                                                                                                                                        
set -e                                                                                                                                                                       
                                                                                                                                                                             
echo "Resetting existing tailscale serve config..."                                                                                                                          
sudo tailscale serve reset                                                                                                                                                   
                                                                                                                                                                             
declare -a ports=(8989 7878 9696 6767 9166 8096 5055 81 25600 3000 3500 2283)                                                                                                
                                                                                                                                                                             
for port in "${ports[@]}"; do                                                                                                                                                
  echo "Starting serve proxy for port $port in background..."                                                                                                                
  sudo tailscale serve --bg --https=$port http://localhost:$port                                                                                                             
  sleep 1                                                                                                                                                                    
done                                                                                                                                                                         
                                                                                                                                                                             
echo "All serve proxies started."                                                                                                                                            
tailscale serve status                                                                                                                                                       
                            
