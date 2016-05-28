
bash 'pspell' do
  code <<-EOH
    sudo apt-get install libpspell-dev -y 
    sudo apt-get install php5-pspell -y
    sudo apt-get install aspell-en -y

    EOH
end

