f = open("test1.hex")
lines = f.readlines();
ar1 = "signal rom0 : RomData := ("
ar2 = "signal rom1 : RomData := ("
ar3 = "signal rom2 : RomData := ("
ar4 = "signal rom3 : RomData := ("
for l in lines:
	cur = l[0:-1]
	ar1 += ("x\""+cur[0:2]+"\",")
	ar2 +=("x\""+cur[2:4]+"\",")
	ar3 += ("x\""+cur[4:6]+"\",")
	ar4 += ("x\""+cur[6:8]+"\",")

ar1 += "others => (others => '0'));"
ar2 += "others => (others => '0'));"
ar3 += "others => (others => '0'));"
ar4 += "others => (others => '0'));"

print ar1,"\n",ar2,"\n",ar3,"\n",ar4,"\n"