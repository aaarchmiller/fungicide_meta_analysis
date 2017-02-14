# fungicide_meta_analysis
Meta-analysis of the effects of fungicide to control soybean rust in the southeastern US

This README.txt file was generated on 20170124 by A.A. ArchMiller

-------------------
GENERAL INFORMATION
-------------------


1. COMPLETE DATA AND ANALYSIS for: Fungicide Effectiveness on Soybean Rust in the Southeastern United States 2004-2014:  A Meta-Analysis



2. Author Information


  Principal Data Contact Information

        A.A. ArchMiller
           Department of Fish, Wildlife, & Cons Bio; 
	   University of Minnesota; 
	   135 Skok Hall; 
	   2003 Upper Buford Circle; 
	   Saint Paul 55108
           Email: althea.archmiller@gmail.com


  Manuscript Corresponding Author Contact Information

        Mary Delaney
          Department of Entomology and Plant Pathology, 
	  Auburn University, AL 36849 USA
          Email: delanma@auburn.edu



3. Date of data collection: Soybean rust fungicide evaluations from 2008 through 2014, compiled in 2015


4. Geographic location of data: Southeastern United States


5. Information about funding sources that supported the collection of the data: none


--------------------------
SHARING/ACCESS INFORMATION
-------------------------- 


1. Licenses/restrictions placed on the data: none


2. Links to publications that cite or use the data: Delaney et al. Fungicide Effectiveness on Soybean Rust in the Southeastern United States 2004-2014: A Meta-Analysis. In preparation for the Journal of Plant Disease


3. Links to other publicly accessible locations of the data: https://github.com/aaarchmiller/fungicide_meta_analysis


4. Links/relationships to ancillary data sets: Data derived from primary literature sources, see below.


5. Was data derived from another source?

References used for meta analysis:

Allen, T.W.  2011a.  Evaluation of foliar fungicide applications to prevent yield loss from aerial web blight in Mississippi, 2010a.  Plant Dis. Manag. Rep. 5:FC120.  Online publication. doi:  10.1094/PDMR05.  



			







	



				
































	



	
		
		
 				






6. Recommended citation for the data: 
 ArchMiller, Althea A; Delaney, Mary A; Delaney, Dennis P; Wilson, Alan E; Sikora, Edward J. (2016). Complete Data and Analysis for: Fungicide Effectiveness on Soybean Rust in the Southeastern United States 2004-2014: A Meta-Analysis. Retrieved from the Data Repository for the University of Minnesota, http://doi.org/10.13020/D62P4F. 



---------------------
DATA & FILE OVERVIEW
---------------------


1. File List
   A. data_processing.html
      
        Code used to take the raw data and clean it up, make moderator variable names consistent, and calculate the effect sizes for each study

   B. data_analysis_bootstrap_rust.html
      
        Code used to for meta-analysis of soybean rust severity. Specifically, calculating mean effect sizes using cluster-level bootstrapping.
        
   C. data_analysis_bootstrap_yield.html

	Code used to for meta-analysis of yield. Specifically, calculating mean effect sizes using cluster-level bootstrapping.

   D. data_analysis_bootstrap_seedwt.html

	Code used to for meta-analysis of 100-seed-weight. Specifically, calculating mean effect sizes using cluster-level bootstrapping.

   E. results_processing.html

	Code that takes the results of the bootstrapped meta-analysis and prepares it for plotting. Also, displays data used in the manuscript results.

   F. results_plotting.html

	Program (code, comments, and output figures) used to create the graphs used in the manuscript.
                
   G. workspace.csv
      
        This is the data that is read into the R program "data_processing.R," where it is further processed for analysis. The final, cleaned data used in the rust, yield, and seed-weight analyses can be found in items H, I, and J, below, respectively.
        
   H. rust_data_cleaned.csv

	This is the data that is used in the rust severity bootstrapping analysis. It is based off of the workspace.csv data, but it has been cleaned with data_processing program.

   I. yield_data_cleaned.csv

	This is the data that is used in the yield bootstrapping analysis. It is based off of the workspace.csv data, but it has been cleaned with data_processing program.

   J. seedwt_data_cleaned.csv

	This is the data that is used in the 100-seed-weight bootstrapping analysis. It is based off of the workspace.csv data, but it has been cleaned with data_processing program.

   K. publication_summary.csv
      
        This is a summary table of all publications/studies used in the meta-analysis. (Used as Table 1 in the manuscript)

   L. Rscripts.zip

	This is the zipped .R files that contain the R programs for analysis and graphing. 

2. Relationship between files:  The raw data (“workspace.csv”) is read into "data_processing.html” program and made ready (and saved) for analysis of XXX (where XXX is either rust severity, yield, or 100-seed-weight) in "data_analysis_bootstrap_XXX.html.” The analysis results are read into “results_processing.html” where results are combined and made into a format for graphing. Then, the cleaned results are read into “result_graphing.html” where figures for the publication are produced. The Rscripts.zip contains all the R codes and they are saved in the .R files. The R codes were written in R-oxygen, which were converted to .Rmd files then to the html files in this dataset. 


3. Additional related data collected that was not included in the current data package: NA

4. Are there multiple versions of the dataset? No, just this final version used in analysis (which is duplicated here and at https://github.com/aaarchmiller/fungicide_meta_analysis)



--------------------------
METHODOLOGICAL INFORMATION
--------------------------


1. Description of methods used for collection/generation of data: 

We identified fungicide trials conducted on soybean for the control of SBR by performing a search of Plant Disease Management Reports (PDMRs), Fungicide and Nematicide Tests (FNTs), and other related review articles from January 2005 to July 2014.  We also included data from unpublished fungicide trials that were conducted in Alabama during the 2009, 2010, and 2013 growing seasons (Dennis Delaney, personal communication) (Table 1).  Inclusion criteria required that the articles be primary, replicated studies that used foliar application of fungicide with a minimum of three replications in addition to a control treatment (i.e., no fungicide application).  We also limited the time period of studies from 2005 (the first full year SBR was present in the U.S.) through 2014 and geographical range to five southeastern states (Alabama, Florida, Georgia, Louisiana, and Mississippi) where significant yield losses from SBR have been observed in commercial fields and research plots (Allen et al. 2014). 



2. Methods for processing the data:

First, the full raw data was subset to include only relevant fields needed for analysis. Secondly, moderator categorical variables and names were standardized. When there were less than 5 effect sizes for a particular moderator category, those records were included in the "other" category. After these steps, data was subset into five separate files, including one dataset each for the soybean rust data; the yield data; the 100-seed-weight data; the Cercospora blight data and the target spot data.

Disease severity was either reported directly in percentages or on varying scales, so we transformed all disease severity scales into percentages for consistent cross-study comparisons. Studies published with the 0-8 scale represented disease severity as follows: 0 to 1 = 0 to 2.5%, >1 to 2 = 2.5 to 5%, >2 to 3 = 5 to 10%, >3 to 4 = 10-15%, >4 to 5 = 15 to 25%, >5 to 6 = 25 to 35%, >6 to 7 = 35 to 67.5%, and >7 to 8 = 67.5 to 100% (e.g., see meta-analysis reference Sikora, and Delaney 2013a).  Studies that published SBR values on the 0-10 scale represented disease severity as follows: 1 to 3 = 0 to 2.5%, >3 to 4 = 2.5 to 5%, >4 to 5 = 5 to 10%, >5 to 6 = 10-15%, >6 to 7 = 15 to 25%, >7 to 8 = 25 to 35%, >8 to 9 = 35 to 67.5%, >9 to 10 = 67.5 to 100% (e.g., see meta-analysis reference Padgett and Purvis 2005b). We imputed disease severity as a percentage based on a constant rate of change between scalar values (Shah and Dillard 2006).  For instance, if mean SBR severity was given as 4.5 out of 10, we calculated the SBR severity in percentage form as 7.5% (i.e., 0.5 of the distance between a value of 4 and a value of 5).
  
All the steps for data processing are in the R program "data_processing.html.”

All data analyses were conducted with the package, metafor, in R.  We calculated the log response ratio from each treatment-specific entry i from each study as:ln⁡(R) =ln⁡(yt/yc), where yt is the mean value from the treated plants and yc is the mean value from the control plants. If a treatment mean SBR severity was 0, we converted it to 0.0001; however, we only included data when the control mean SBR severity was ≥5%. All meta-analyses entries were weighted by the level of disease pressure as defined by the mean SBR severity from untreated control plants. We analyzed mean log response ratios using random-effects models with a Restricted Maximized Likelihood Estimator and evaluated overall means and 95% confidence intervals with cluster-level (i.e., study-level) bootstrapping. 

3. Instrument- or software-specific information needed to interpret the data:

  Program R (Full details of R session information including the packages used are available at the bottom of each output html file)

4. Standards and calibration information, if appropriate: NA


5. Environmental/experimental conditions: NA


6. Describe any quality-assurance procedures performed on the data:

Data has been extensively cross-referenced and checked for quality control and assurance.

7. People involved with sample collection, processing, analysis and/or submission:

M.A. Delaney recorded the data from the publications used in the meta-analysis; A.A. ArchMiller conducted the data processing, data analysis, and data QA/QC.


-----------------------------------------
DATA-SPECIFIC INFORMATION FOR: workspace.csv
-----------------------------------------

1. Number of variables: 48


2. Number of cases/rows: 569


3. Missing data codes:
     NA       Data was not available in the corresponding publication for that variable

4. Variable List

    A. FID:
       Unique number for each record

    B. Reference:
       Short identifier for each reference 

    C. ReferenceNumb:
       Unique number for each reference (cross-references with ReferenceNumb in publication_summary.csv)

    D. studyYear:
       Year in which study was conducted
       
    E. State:
       State in which study was conducted
       
    F. location:
       Specific study location (e.g., research station)
		NFREC = North Florida Research & Education Center, Quincy, FL
		GCREC = Gulf Coast Research & Education Center, Wimauma, FL
		EV Smith or EVS or EVSREC = Auburn University E.V. Smith Research Center, Shorter, AL
		TVREC or TVRREC = Tennessee Valley Research & Education Center, Tennessee River, AL
		Noxubee Co = Noxubee County, MS
		Clay Co = Clay County, MS
		ARC or ATC = Attapulgus Research and Education Center, Attapulgus, GA
		bhrs = Ben Hur Research Station, Baton Rouge, LA
		Brewton = Auburn University Brewton Agricultural Research Unit, Brewton, AL
		CPES = University of Georgia Coastal Plain Experiment Station, Tifton, GA
		DLRS = Dean Lee Research Station, Alexandria, AL
		ifas = Institute of Food and Agriculture as in: University of Florida, Institute of Food and Agriculture Plant Science Research and Education Unit, Citra, FL
		Lang farm = University of Georgia Coastal Plain Experiment Station, Lang Research Farm, Tifton, GA
		NRS = Northeast Research Station, Winnsboro, LA
		SAER = Sunbelt Ag Expo Research Farm, Moultrie, GA
		SMREC = Sand Mountain Research and Extension Center
		UGRF = University of Georgia Research Farm, Attapulgus, GA
       
    G. soil:
       Soil type at study location
       
    H. planted.date:
       Date the soybean plants were planted. In the 1900 date system, the first day that is supported is January 1, 1900. When you enter a date, the date is converted into a serial number that represents the number of elapsed days since January 1, 1900. For example, if you enter July 5, 1998, Excel converts the date to the serial number 35981. To convert to R date format in your data frame “df”, use:
	df$newplantdate <- as.Date(df$planted.date, origin=“1900-01-01”)
       
    I. Date.rust.first.appeared:
       The date that soybean rust was first detected. In the 1900 date system, the first day that is supported is January 1, 1900. When you enter a date, the date is converted into a serial number that represents the number of elapsed days since January 1, 1900. For example, if you enter July 5, 1998, Excel converts the date to the serial number 35981. To convert to R date format in your data frame “df”, use:
	df$newrustdate <- as.Date(df$Date.rust.first.appeared, origin=“1900-01-01”)
       
    J. Growth.stage.applied:
       The growth stage(s) during which fungicide was applied to the soybean plants:
		V : Vegetative
		R1 : Beginning Bloom
		R2 : Full Bloom
		R3 : Beginning Pod
		R4 : Full Pod
		R5 : Beginning Seed
		R6 : Full Seed
		R7 : Beginning Maturity
		R8 : Full Maturity
       
    K. applicationsNumb:
       The total number of fungicide applications
       
    L. trade.name:
       The specific fungicide name
            
            * "fb" means followed by (i.e., more than 1 application)
            * "+" means mixture 
            
    M. active.ingredient:
       The specific fungicide active ingredient(s)

            * "fb" means followed by (i.e., more than 1 application)
            * "+" means mixture 
            
    N. active.ingredient.coded:
        The coded identifier for each active ingredient

            * "fb" means followed by (i.e., more than 1 application)
            * "+" means mixture 
            
    O. class:
        The specific fungicide class
        
    P. class.code:
        The specific fungicide class coded/abbreviated
        
    Q. amount:
        The amount of fungicide applied in either fluid oz per acre or pound per acre or volume percent (v/v or %). 
            * "fb" means followed by (i.e., more than 1 application)
            * "+" or “,” means mixture of two quantities
	     * “?” signifies when the amount of fungicide was not provided in the reference.

    R. stats:
        Experimental protocol. 
	
	    * In all cases, rcb = Randomized Complete Block
        
    S. replications:
       Number of replications for each treatment

    T. mean.sep:
       The significance level and statistical test used to test for mean separation between treatment and control 
       
    U. rustSeverPerc:
       The mean percentage of rust severity for treated plants
    
    V. rustSeverPercLSD:
       Fisher's protected least significant difference for rust severity in percentage 
       
    W. rustSeverPercCont:
       The mean percentage of rust severity for control plants
      
    X. rustSeverPercContLSD:
       Fisher's protected least significant difference for rust severity in percentage 
       
    Y. rustSever1.8:
       Rust severity as measured on a scalar (usually from 1-8) for treated plants
       
    Z. rustSever1.8LSD:
       Fisher's protected least significant difference for rust severity as a scale
       
    AA. rustSever1.8Cont:
       Rust severity as measured on a scalar (usually from 1-8) for control plants
       
    AB. rustSever1.8ContLSD:
       Fisher's protected least significant difference for rust severity as a scale
       
    AC. Tsincidence:
       Mean target spot incidence rate for treated plants
       
    AD. TSincidenceLSD:
       Fisher's protected least significant difference for target spot incidence rate
       
    AE. TSincidenceCont:
       Mean target spot incidence rate for control plants
       
    AF. TSincidenceContLSD:
       Fisher's protected least significant difference for target spot incidence as a scale
       
    AG. Tsseverity:
       Mean target spot severity for treatment plants
       
    AH. TSseverityLSD:
       Fisher's protected least significant difference for target spot severity
       
    AI. TSseverityCont:
       Mean target spot severity for control plants
       
    AJ. TSseverityContLSD:
       Fisher's protected least significant difference for target spot severity
       
    AK. CercoSever:
       Mean Cercospora blight severity for treatment plants
       
    AL. CercoSeverLSD:
       Fisher's protected least significant difference for Cercospora severity
    
    AM. CercoSeverCont:
       Mean Cercospora blight severity for control plants
       
    AN. CercoSeverContLSD:
       Fisher's protected least significant difference for Cercospora severity
       
    AO. yield:
       Mean yield (bushels per hectare) of soybeans for treatment plants
       
    AP. yieldLSD:
       Fisher's protected least significant difference for yield (bushels per hectare)
       
    AQ. yieldCont:
       Mean yield (bushels per hectare) of soybeans for control plants
       
    AR. yieldContLSD:
       Fisher's protected least significant difference for yield (bushels per hectare)
       
    AS. seedWt:
       Mean 100-seed-weight (g) for soybean from treatment plants
       
    AT. seedWtLSD:
       Fisher's protected least significant difference for 100-seed-weight (g)
       
    AU. seedWtCont:
       Mean 100-seed-weight (g) for soybean from control plants
       
    AV. seedWtContLSD:
       Fisher's protected least significant difference for 100-seed-weight (g)

-----------------------------------------
DATA-SPECIFIC INFORMATION FOR: XXX_data_cleaned_.csv
	where XXX is either “rust”, “yield” or “seedwt”
-----------------------------------------
       
1. Number of variables: varies (18 for rust_data_cleaned.csv; 19 for yield_ and seedwt_data_cleaned.csv)


2. Number of cases/rows: varies (320 for rust_data_cleaned.csv; 288 for yield_data_cleaned.csv; 144 for seedwt_data_cleaned.csv)


3. Missing data codes:
     NA       Data was not available in the corresponding publication for that variable

4. Variable List for all variables that are identical across cleaned datasets

    A. FID:
       Unique number for each record

    B. Reference:
       Short identifier for each reference 

    C. ReferenceNumb:
       Unique number for each reference (cross-references with ReferenceNumb in publication_summary.csv)

    D. studyYear:
       Year in which study was conducted
       
    E. State:
       State in which study was conducted
       
    F. location:
       Specific study location (e.g., research station)
		NFREC = North Florida Research & Education Center, Quincy, FL
		GCREC = Gulf Coast Research & Education Center, Wimauma, FL
		EV Smith or EVS or EVSREC = Auburn University E.V. Smith Research Center, Shorter, AL
		TVREC or TVRREC = Tennessee Valley Research & Education Center, Tennessee River, AL
		Noxubee Co = Noxubee County, MS
		Clay Co = Clay County, MS
		ARC or ATC = Attapulgus Research and Education Center, Attapulgus, GA
		bhrs = Ben Hur Research Station, Baton Rouge, LA
		Brewton = Auburn University Brewton Agricultural Research Unit, Brewton, AL
		CPES = University of Georgia Coastal Plain Experiment Station, Tifton, GA
		DLRS = Dean Lee Research Station, Alexandria, AL
		ifas = Institute of Food and Agriculture as in: University of Florida, Institute of Food and Agriculture Plant Science Research and Education Unit, Citra, FL
		Lang farm = University of Georgia Coastal Plain Experiment Station, Lang Research Farm, Tifton, GA
		NRS = Northeast Research Station, Winnsboro, LA
		SAER = Sunbelt Ag Expo Research Farm, Moultrie, GA
		SMREC = Sand Mountain Research and Extension Center
		UGRF = University of Georgia Research Farm, Attapulgus, GA

    G. m1i
	Mean value of effect size from the treated plants
		For yield_data_cleaned.csv, units are in kg per hectare
		For seedwt_data_cleaned.csv, units are in g
		For rust_data_cleaned.csv, units are in %

    H. m2i
	Mean value of the effect size from the control plants
		For yield_data_cleaned.csv, units are in kg per hectare
		For seedwt_data_cleaned.csv, units are in g
		For rust_data_cleaned.csv, units are in %

    I. n2i
	Sample size for control plants

    J. n1i
	Sample size for treated plants

    K. category_ai
	Category of active ingredient used for bootstrapping analysis

    L. category_class
	Category of fungicide class used for bootstrapping analysis

    M. category_rstage
	Category of growth stages used for bootstrapping analysis

    N. number_applications
	Number of the applications of fungicide for bootstrapping analysis

    O. category_pressure
	Category of rust severity pressure as measured from control plants for bootstrapping analysis

    P. category_year
	Year of the study as a character for bootstrapping analysis

    Q. yi
	Log response ratio of the mean from the treated plants over the mean of the control plants

    R. vi
	Variance as calculated with 1s as the individual standard deviations. Required for escalc() even though analysis with log response ratio does not use the variance estimate.
	
	
5. Variable List for variable included in yield_data_cleaned.csv and seedwt_data_cleaned.csv   
    A. rust.m2i
	The severity of rust in control plants (%), used to weight the log response ratio during the bootstrapping analysis

-----------------------------------------
DATA-SPECIFIC INFORMATION FOR: publication_summary.csv
-----------------------------------------

1. Number of variables: 7


2. Number of cases/rows: 61


3. Missing data codes:

4. Variable List

    A. Reference:
       Citation for each study used in the meta-analysis

    B. Type:
        PDMR        	Plant Disease Management Report
        PHP        	Plant Health Progress Journal 
        FNT        	Fungicide & Nematicide Tests
        UP	        Unpublished studies

    C. Study Year
	Year in which the study was conducted

    D. State
	State in which the study was conducted

    E. n
	Number of experimental treatments (Effect sizes) derived from that study

    F. Used
	Whether the study was used in the analysis (“Yes”) or not (“No”)

    G. Reason
	Why the study was not used in the analysis when Used=No