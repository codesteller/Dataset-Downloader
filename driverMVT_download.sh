#!/bin/bash
# Download the DriverMVT dataset from Zenodo
#wget https://zenodo.org/records/6542011/files/DriverMVT.z01?download=1 -O DriverMVT.z01
wget https://zenodo.org/records/6584185/files/DriverMVT.z02?download=1 -O DriverMVT.z02
wget https://zenodo.org/records/6588955/files/DriverMVT.z03?download=1 -O DriverMVT.z03
wget https://zenodo.org/records/6584389/files/DriverMVT.zip?download=1 -O DriverMVT.zip

# Unzip the dataset
unzip DriverMVT.zip