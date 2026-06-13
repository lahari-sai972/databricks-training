# Week 3 - Day 2: Databricks PySpark File Handling Practice

## 📌 Overview

On Day 2 of Week 3, I started practicing basic PySpark operations using Databricks Free Edition. The focus of today's work was learning how to upload CSV datasets into Databricks Volumes, access file paths, and display uploaded files using PySpark utilities and DataFrames.

This practice helped me understand the basics of the Databricks workspace, notebook execution, and file handling using PySpark.

---

## 🛠️ Tools Used

* Databricks Free Edition
* PySpark
* GitHub

---

## 📚 Topics Covered

### 🔹 Databricks Basics

* Databricks Workspace
* Databricks Notebooks
* Unity Catalog
* Volumes
* File handling in Databricks

### 🔹 PySpark Basics

* PySpark DataFrames
* spark.read.csv()
* Data display using show()
* inferSchema=True
* header=True

### 🔹 File System Utilities

* dbutils.fs.ls()
* File path verification
* Volume storage paths

---

## 🗂️ Work Done

* Uploaded `empData.csv` and `Big Sales.csv` into Databricks Volumes
* Practiced file handling using Unity Catalog Volumes
* Verified uploaded files using `dbutils.fs.ls()`
* Read CSV files using `spark.read.csv()`
* Displayed datasets using PySpark DataFrames
* Explored Databricks notebook execution workflow
* Learned how Databricks stores files using Volumes instead of DBFS

---

## 📊 What I Learned Today

* How Databricks notebooks work
* How files are uploaded and stored in Databricks
* Difference between DBFS and Unity Catalog Volumes
* How PySpark reads CSV files using DataFrames
* Purpose of `header=True` and `inferSchema=True`
* How `dbutils.fs.ls()` helps verify uploaded files
* Better understanding of basic PySpark workflow and file handling

---

## 📁 Files Included

* `Day1_PySpark_Practice.ipynb` → Databricks notebook file

---

## 🔗 Platform Used

Databricks Free Edition:

https://www.databricks.com/learn/free-edition

---

## 🚀 Conclusion

Day 2 helped me understand the basics of Databricks and PySpark file handling. Through hands-on practice, I learned how to upload datasets into Volumes, verify uploaded files, read CSV data using PySpark, and display structured datasets using DataFrames inside Databricks notebooks.
