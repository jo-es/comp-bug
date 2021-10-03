user=0x309d413391e975B553B7B8D19bC11F8a6c2eB889
comptroller=0x3d9819210A31b4961b30EF54bE2aeD79B9c9Cd3B

echo ${ETHERSCAN_API_KEY}

marketsString=$(seth call $comptroller "getAssetsIn(address)(address[])" $user)
marketsArray=(${marketsString//,/ })

for market in ${marketsArray[@]}; do
  marketName=$(seth call $market "name()(string)")
  echo $market $marketName
done
