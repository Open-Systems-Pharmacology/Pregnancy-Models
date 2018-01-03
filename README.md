# Physiologically Based Pharmacokinetic Models for Pregnant Women

Within this repository, we distribute the physiologically-based whole-body models for Pregnant Women published in [[1,2,3](#references)].

The models comprise 27 compartments, including nine pregnancy-specific compartments as shown in the schema below.
<p align="center">
<img src="ModelStructure.png" width="60%">
</p>

## Repository files
* The models are provided as ready-to-use MoBi and PK-Sim projects (subfolder _Models_)
  * _Cefazolin_, _Cefuroxime_ and _Cefradine_ model evaluation is described in [[3](#references)]
  * _Caffeine_, _Midazolam_, _Nifedipine_, _Metoprolol_, _Ondansetron_, _Granisetron_, _Diazepam_ and _Metronidazole_ model evaluation is described in [[1](#references)]

* _BuildingBlocks_ subfolder contains MoBi building block for spatial structure and passive transports. Those building blocks can be used in MoBi to build new substance models.

## HowTo
Currently, simulations based on pregnant individuals cannot be built up directly in PK-Sim (due to the fact that e.g. for the protein model not all required data was collected). 

### How to combine an existing (MoBi) pregnancy model with a pregnancy population created in PK-Sim
Steps 3 to 5 are performed in PK-Sim.
1. If a (MoBi) pregnancy model is available in **pkml** format, go to the step 3
2. If a (MoBi) pregnancy model is available in **mbp3** format (MoBi project): open it in MoBi, select simulation of interest and save it in pkml format
3. Create an Individual using population **Pregnant (Dallmann et al. 2017)**

   _Please note that in PK-Sim®, the fertilization age (FA) is defined via the individual’s age, with 30 years corresponding to a FA of 0 weeks (i.e. just prior to conception). Hence, a pregnant woman with a FA of 38 weeks is defined using an age of 30.75 years._

4. Create a pregnancy population with the required settings based on the individual above
5. Import (MoBi) pregnancy model in **pkml** format and combine it with created population building block as described in the [OSP Suite manual](https://github.com/Open-Systems-Pharmacology/OSPSuite.Documentation/blob/master/Open%20Systems%20Pharmacology%20Suite.pdf) (**Ch. 21.2 Importing Individual and Population Simulation**)

### How to create a new pregnancy model
The procedure will be desribed in a comprehensive tutorial that will be published soon.


## Version information
The physiology is based on the PBPK model implemented in PK-Sim version 6.3. The MoBi project files were created in version 6.3.

## Code of conduct
Everyone interacting in the Open Systems Pharmacology community (codebases, issue trackers, chat rooms, mailing lists etc...) is expected to follow the Open Systems Pharmacology [code of conduct](https://gitprint.com/Open-Systems-Pharmacology/Suite/blob/master/CODE_OF_CONDUCT.md).

## Contribution
We encourage contribution to the Open Systems Pharmacology community. Before getting started, please read the [contribution guidelines](https://gitprint.com/Open-Systems-Pharmacology/Suite/blob/master/CONTRIBUTING.md). If you are contributing code, please be familiar with the [coding standards](https://gitprint.com/Open-Systems-Pharmacology/Suite/blob/master/CODING_STANDARDS.md).

## License
The models are distributed under the [GPLv2 License](https://github.com/Open-Systems-Pharmacology/Suite/blob/develop/LICENSE).

## References
[1][Dallmann A, Ince I, Coboeken K, Eissing T, Hempel G. A Physiologically Based Pharmacokinetic Model for Pregnant Women to Predict the Pharmacokinetics of Drugs Metabolized Via Several Enzymatic Pathways. Clin Pharmacokinet. 2017 Sep 18. doi: 10.1007/s40262-017-0594-5. [Epub ahead of print]](https://www.ncbi.nlm.nih.gov/pubmed/28924743)

[2][Dallmann A, Ince I, Meyer M, Willmann S, Eissing T, Hempel G. Gestation-Specific Changes in the Anatomy and Physiology of Healthy Pregnant Women: An Extended Repository of Model Parameters for Physiologically Based Pharmacokinetic Modeling in Pregnancy. Clin Pharmacokinet. 2017 Apr 11. doi: 10.1007/s40262-017-0539-z. [Epub ahead of print]](https://www.ncbi.nlm.nih.gov/pubmed/28401479)

[3][Dallmann A, Ince I, Solodenko J, Meyer M, Willmann S, Eissing T, Hempel G. Physiologically Based Pharmacokinetic Modeling of Renally Cleared Drugs in Pregnant Women. Clin Pharmacokinet. 2017 Apr 8. doi: 10.1007/s40262-017-0538-0. [Epub ahead of print]](https://www.ncbi.nlm.nih.gov/pubmed/28391404)

