# Recognition of Mammal Genera on Camera-Trap Images using Multi-Layer Robust Principal Component Analysis and Mixture Neural Networks
By Jhony Heriberto Giraldo Zuluaga, Augusto Salazar, Alexander Gomez, Angélica Diaz Pulido

**Abstract**: The segmentation and classification of animals from camera-trap images is a difficult task due to the conditions under which the images are taken. This work presents a method for recognizing mammal genera from camera-trap images. Our method uses Multi-Layer Robust Principal Component Analysis (RPCA) for segmenting, Convolutional Neural Networks (CNNs) for extracting features, Least Absolute Shrinkage and Selection Operator (LASSO) for selecting features, and Artificial Neural Networks (ANNs) or Support Vector Machines (SVM) for classifying mammal genera present in the Colombian forest. Our classification method mixes the features of several CNNs. We evaluated our method with the camera-trap images from the Instituto de Investigación de Recursos Biológicos Alexander von Humboldt. We obtained an accuracy of 92.65% classifying 8 mammal genera and a False Positive (FP) class, using automatic-segmented images. On the other hand, we reached 90.32% of accuracy classifying 10 mammal genera, using ground-truth images only. Unlike all previous works, we confront the animal segmentation and genera classification on the camera-trap framework. This method shows a new approach toward a fully-automatic detection of animals from camera-trap images.

## Citing Mixture Neural Networks

If you find Multi-Layer RPCA useful in your research, please consider citing:

```
@inproceedings{giraldo2017recognition,
  title={Recognition of Mammal Genera on Camera-Trap Images using Multi-Layer Robust Principal Component Analysis and Mixture Neural Networks},
  author={Giraldo-Zuluaga, Jhony-Heriberto and Salazar, Augusto and Gomez, Alexander and Diaz-Pulido, Ang{\'e}lica},
  booktitle={Tools with Artificial Intelligence (ICTAI), 2017 IEEE 29th International Conference on},
  pages={53--60},
  year={2017},
  organization={IEEE}
}
```
