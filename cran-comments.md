## R CMD check results

0 errors ✔ | 0 warnings ✔ | 0 notes ✔

* This is a new release.


Subject: Response to ‘pikchr’ Package Submission Comments

Dear Benjamin Altmann,

Thank you for reviewing my package ‘pikchr’. I have reviewed and addressed the points you raised. Below is a detailed response, explaining the changes made:

	1.	Use of Single Quotes in Title and Description
The package names, software names, and API names in the title and description have been adjusted to follow CRAN guidelines. For example, ‘R’ and ‘pikchr’ now use single quotes only where necessary, and developer names are no longer quoted.

	2.	Link in Description Instead of Title
The link to ‘pikchr’ has been moved from the title to the description, as per the recommendation.

	3.	Examples for Unexported Functions
The following examples were removed as the functions are not exported:
	-	eng_pikchr_validate_options() in eng_pikchr_validate_options.Rd
	-	run_hook_plot() in run_hook_plot.Rd
These functions remain unexported, and the corresponding examples have been omitted from the documentation.

	4.	Unexecutable Code in man/eng_pikchr.Rd
I reviewed and corrected the code in man/eng_pikchr.Rd. Any syntax issues have been resolved, and all code is now executable.

	5.	Use of \dontrun{}
I replaced the use of \dontrun{} with \donttest{} where appropriate. All unnecessary \dontrun{} wrappers have been removed.

	6.	Writing to tempdir() Instead of Home Filespace
Any writing operations in funciton have been modified to ensure they write to tempdir() instead of the user’s home directory. This has been implemented in R/engine.R where applicable.

	7.	Authors@R Field
The Authors@R field has been updated to ensure all authors, contributors, and copyright holders are properly credited, following CRAN policies. Specifically:
	-	D. Richard Hipp, who contributed to the ‘pikchr’ source code, is listed with a "ctb" role.
	-	Brian Kernighan, whose work inspired ‘PIC’, is credited appropriately without single quotes and listed with a "ctb" role.
	-	Additional contributors and copyright holders have been specified, ensuring ownership and intellectual property rights are clear and unambiguous.

Thank you for your time and consideration. Please let me know if there are any further changes required.