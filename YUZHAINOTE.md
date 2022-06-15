# Mechanochemistry with xTB

## EFEI in xTB
I have add EFEI function to xTB (GFN2, GFN1, and GFN0), and in our case we should use GFN2. To use it, in the detailed input file, type in
```
$efei
  atom1=1
  atom2=29
  force = 4.0
$end
```
where 
+ `atom1` and `atom2` are serial of atoms on which the force is applied. 
+ `force` is the magnitude of the force, in nano-Newton (nN).

## Constraint in xTB is used as the bias potential in umbrella sampling
The constraint in xTB is actually an external harmonic potential.
We use it as the bias potential as in umbrella sampling.
The format is like
```
  $constrain
     force constant=0.5
     distance: 3, 4, 2.4
  $end
```
where
+ `force constant` is the coefficient $k$ of the added constraint potential $u(\xi)=k\xi^2$, in atomic unit (Eₕ/a₀²).
+ `distance` defines the constraint by atom1, atom2, and the reference distance in Angstrom (Å).
