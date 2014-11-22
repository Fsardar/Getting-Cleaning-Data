---
title: "Codebook - Getting and Cleaning Data - run_analysis.R"
author: "Faisal"
date: "Friday, November 21, 2014"
output: pdf_document
---

Objective:

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
Items submited:

1) a tidy data set as described below

2) a link to a Github repository with your script for performing the analysis, and 

3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
Also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

Explanation:

The data for this project is collected from Samsung Galaxy S smartphone wearables devices. A full description is available at the site where the data was obtained. There is test & train data that is:

1) merge into one dataset

    - Subject, x-axis & y-axis data
    
    - first complete datasets for test and train data are created using cbind
    
    - features column headers are added to the data sets
    
    - then the two data sets are combined using rbind

2) A data set is created by extracting columns with headers containing mean & std

    - Additionally subject & activity are also extracted to maintain validity of data
    
3) Descriptive lables are used to replace the "Activity" items

4) Descriptive variables names used to name variables

5) Data is reshaped

    - data if first melted using id's "subject" & "activity" - the rest of the fields are measures
    
    - data is then summarized using dcast and applying mean function on the variables

Finaly the data is output to file upload.txt and the entire repo is pushed to github.

