ML Fairness from Sampling to Calibration in R

Googlers aim to build for everyone, but unconscious bias can influence
how teams collect and classify data, write code, and design
products. The machine learning (ML) systems we create can reflect or
reinforce unfair biases. Through work on ML fairness, we seek to
understand, remediate, and prevent unjust or prejudicial treatment of
people that arises from these systems and is related to sensitive
characteristics such as race, income, sexual orientation, or
gender. Relatedly, YouTube seeks to identify videos which violate
community standards even when those videos are rare. Minimizing bias
in a statistical sense is often challenging with big data, which is
disproportionately observational, as is identifying the true rate of
prevalence of content which violates community standards. After a
brief overview of how R is used at Google, this talk introduces
importance sampling, which can be helpful in this context, as well as
calibration functions which are often needed to properly
cross-validate ML models from such non-uniform samples. In terms of
software, identifying the contours of populations with sensitive
characteristics often involves exploratory analysis best done with the
R library dplyr in combination with a SQL library interface, such as
SQLite. The R library diagis provides useful tools for importance
sampling. For calibration functions, there are several options
available, such as the 'iso' package, which implements isotonic
regression; this talk briefly demonstrates how to do i-splines with
the R library keras.

Suggested reading:

http://www.unofficialgoogledatascience.com/2019/08/estimating-prevalence-of-rare-events.html
https://en.wikipedia.org/wiki/B-spline
https://cran.r-project.org/web/packages/diagis/vignettes/diagis.pdf

Chapter 9 on importance sampling of http://statweb.stanford.edu/~owen/mc/

Check out https://github.com/google/ml-fairness-gym or consider taking
the Google ML Fairness crash course:
https://developers.google.com/machine-learning/crash-course/fairness/video-lecture
