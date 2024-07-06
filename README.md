# Powershell-WebsiteImageDownloader-Module

This repository will house the code for a Powershell module that downloads all JPG images over a certain resolution from an identified website and all accessible subpages.

## Project Starting Point is Powershell Code Created on request by Google's Gemini AI Service

At my request, Gemini created a simple, non-modularized Powershell script that downloads JPG images from a passed website address to an identified local directory.  While this script is fairly basic and lacks some of the clarity and features found in well written and documented Powershell code, it is functional and does make an excellent starting point.    For reference, I have included this script, in it's original form exactly as provided by the Google Gemini AI, in the repository saved as: 

**"Google_Gemini_Generated_Script.ps1"**

## WebsiteImageDownloader Module - Initial Project Goals

The initial version of the module will have the following features:

* Have the Primary Functions Get-WebsiteImage & Save-WebsiteImage that take the following parameters:

    +  Website Address
    +  Local Directory to Save Downloaded Images
    +  Resolution Size Specification in order for JPGs to be downloaded
    +  Optional Subpage Depth Limit - To tell the module not to download images beyond a certain depth below the starting address
 Optional Verbose Switch - To indicate module should generate verbose output to the screen

* Have well documented code that makes use of Powershell language features
    
* Make use of the features on GitHub to make the project be a solid example of the project management benefits provided by GitHub including but not limited to:

   + Use of the GitHub Repository Issues system to:
        * List of planned tasks to yet be completed for the project
        * List identified bugs to be fixed

   + Use Github Milestones & Projects to identify major project progress points
   + Use GitHub.Pages to create a Wiki site for the repository that:
        * Lists the plans and goals for the repository
        * Provides adequate documentation on the use of the module code built in the repository
