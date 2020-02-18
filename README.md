# toyfold1_rhiju
Testing calculations for simple Toyfold RNA folding model in 1D

(C) R. Das, Stanford University 2020

## Features
* Brute-force enumeration of bead-based model for RNA folding
* Simple script to display RNA conformations
* Scoring of conformations based on Toyfold model -- pair energy, freezing upon forming helix, penalty for bending RNA
* Exact calculation of partition function and base pair probabilities, including pseudoknots.
* Exact calculation of mutate-and-map-seq 'data'
* Enumerative design of sequences that fold into target structures 
* Enumerative design of sequences that can carry out target computations as functions of input ligand concentrations _[TODO]_
* Checks of nearest-neighbor decomposition to quickly calculate free energies for nested secondary structures _[TODO]_
* Code up and check quick calculation of tertiary folding free energies _[TODO]_

## Getting started
* Add to your MATLAB path the directory `scripts/` and all subdirectories 
* To see enumeration over all states of a sequence designed to fold into a pseudoknot, try
```
analyze_sequence('CGAAACCCGAGG');
```
You should get something like:
![analyze_sequence_example_output.png](assets/analyze_sequence_example_output.png)

* For some other fun examples, try a sequence that does not fold as cleanly into a pseudoknot:
``` 
analyze_sequence('CCAAAGGGGACC');
```
 Or one that takes advantage of 'lowercase' perfect matches to get the best possible pseudoknot:
``` 
analyze_sequence('abXXXcdbaXdc');
```
 
* For more examples of using scripts, you can check out the unit tests. In MATLAB, go into `scripts/unittests` and type `runtests`.

## Notes
* The Toyfold model is developed through Notes available in a Google Team Drive -- contact rhiju for notes. 
* The 'pencil-and-paper' variant of the model (modular helices, strong bending penalty) is being written up into a pedagogical paper by folks in the Das lab.
* This repo is meant to help test rules even in the limit of weak bending penalties where there can be a *lot* of conformations that are hard to track with pencil and paper.
