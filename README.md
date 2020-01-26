# toyfold1_rhiju
Testing calculations for simple Toyfold RNA folding model in 1D

(C) R. Das, Stanford University 2020

## Goals
* Brute-force enumeration of bead-based model for RNA folding
* Simple script to display RNA conformations
* Scoring of conformations based on Toyfold model -- pair energy, freezing upon forming helix, penalty for bending RNA
* Check nearest-neighbor decomposition to quickly calculate free energies for nested secondary structures
* Code up and check quick calculation of tertiary folding free energies

## Notes
* The Toyfold model is developed through Notes available in a Google Team Drive -- contact rhiju for notes. 
* The 'pencil-and-paper' variant of the model (modular helices, strong bending penalty) is being written up into a pedagogical paper by folks in the Das lab.
* This repo is meant to help test rules even in the limit of weak bending penalties where there can be a *lot* of conformations that are hard to track with pencil and paper.
