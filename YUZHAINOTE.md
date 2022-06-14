# EFEI in xTB
I have add EFEI function to xTB. To use it, in the detailed input file, type in
```
$efei
  atom1=1
  atom2=29
  force = 4.0
$end
```
where 
+ `atom1` and `atom2` are serial of atoms on which the force is applied. 
+ `force` is the magnitude of the force, in nana-Newton (nN).