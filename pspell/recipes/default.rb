
bash 'pspell' do
  code <<-EOH
    sudo apt-get install libpspell-dev 
    sudo apt-get install php5-pspell
    sudo apt-get install aspell-en

    EOH
end

