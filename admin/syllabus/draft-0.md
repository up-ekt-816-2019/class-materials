% Syllabus: Graduate Econometrics
% Jesse Naidoo
% \today

# Basics

__Probability and Statistics__

- distributions
- conditional expectations and linear projections
- laws of large numbers and central limit theorems
- estimation and identification
- hypothesis testing
    * testability vs identifiability
    * nuisance and ancilliary parameters (application: Hahn (1998) paradox)
    * multiple testing
    * Jeffreys-Lindley paradox
    * significance testing and the likelihood principle
- weights, stratification and clustering

__Ordinary Least Squares__

- computation
- interpretation as a causal estimate
- robust standard errors

__Instrumental Variables__

- inference for just-identified case
- weak instruments
- computation: showing the first stage

__Generalized Method of Moments__

- setup
- inference
- weak instruments (wide panels)

# Special Topics in Microeconometrics

__Common Nonlinear Models__

- censored and truncated data
- limited dependent variables (discrete choice)
- duration analysis
- quantile regression

__Treatment Effects, Causality, and Sample Selection__

- potential outcomes and selection rules
- experiments
- selection on observables: regression and matching
- selection on unobservables
    * IV (RDD as a special case)
    * control functions and the MTE
    * comparison between the two
    * a useful trick: Altonji, Elder and Taber (2005); Andrews and Oster (2018)
- diff-in-diff
    * implementation via GMM
    * interpretation: additive separability and limits to anticipation
    * life-cycle labor supply and 'dynamic treatment effects'
    * randomization inference, when and how to cluster
    * nonparametric version: 'changes-in-changes'
- synthetic control and 'matrix completion'


__Measurement Error, Nonresponse, and Missing Data__

- measurement error and latent variables
- solutions: validation data and instrumental variables
- data is missing at random: inverse probability weighting
- multiple imputation or data augmentation
- sample selection as a specification error
- partial identification

# Extensions
__Likelihood-Based Approaches__

- robustness vs efficiency
- nuisance parameters, fiducial inference
- what does `identification' mean to a Bayesian?

__Nonparametric Methods__

- data summary
- matching as nonparametric version of OLS
- curse of dimensionality
- bias-variance tradeoff and regularization
- non-testability, moments, and quantiles

__Canonical 'Structural' Papers__

- Keane and Wolpin
- Rust
- Choo and Siow; Sinha (2015)

# Textbook
For at least the first part of the course, we will use Bruce Hansen's textbook, simply called 'Econometrics'. For the second part of the course we will use lecture notes and articles, although the Hansen book is useful there too. Angrist and Pischke's 'Mostly Harmless Econometrics' is useful for the section on treatment effects and causality. You will encounter their influence everywhere in applied work, so it is important to be able to 'speak their language', even if you do not accept all of their methodological propaganda.

Other than the first section (probability review), everything in the first section is covered in Newey and McFadden (1994).

# Computation
We will use R because it is

- well-suited to programming your own analysis (like MATLAB or python)
- easy to interface with compiled languages in case you need to speed up code bottlenecks
- capable of all the core econometric methods (like STATA)
- well-supported by a large and active community in statistics, public health, econometrics, and the private sector
- extremely good for data manipulation and visualization (especially with the tidyverse and ggplot2 packages)
- supported by the Rmarkdown scripting language which makes it easy to communicate and reproduce research
- free and open-source (unlike STATA and MATLAB).

Python (using the pandas and statsmodels packages) is a good alternative according to the above criteria, although its functionality for certain econometric techniques (e.g. clustered standard errors) is not quite as well-developed as those of R. However, R has an awkward syntax and behaves strangely as a language (e.g. `is.integer(2)` returns `FALSE`), but our goal is to get to the econometrics quickly, without spending too much time developing and testing new packages. We can try to pay it forward to the broader econometrics and python communities on our own time.

Some useful places to get help on R:

- stackoverflow
- r-econometrics.com
- R for Data Science
- Applied Econometrics with R

# Some Opinions About Empirical Methods

Here are some questions I have always wondered about. These are my answers, so far. It would not be hard to find other economists who don't agree with them, and you don't have to, either. 

\par There are many ways to do good empirical work in economics, and my goal for this class is to give you a solid foundation in the basics, and point you to where to learn more when you have a more specialized problem to solve in your own research.

\par __Why does all empirical work in economics take the form of regressions? Surely there are other things we could do with our data?__

* This is almost true, but not quite. 'Structural' work, typically estimated by maximum likelihood, exploits other aspects of the data besides the first two moments. 
* Of course, if you estimate a linear regression on some nonlinear transformations of the data, your estimates will depend on things other than the means, variances and covariances of the _original_ data, so the distinction between 'regressions' and 'higher-order moments' is not perfectly clean.
* The main reason why we run regressions is that our theories are usually pretty weak, and imply at most some restrictions on conditional means. GMM is a way of estimating 'partially specified' models. 
* We want to estimate partially specified models because we fear misspecification. If we were willing to commit to all the details of an economic model, we would be able to derive the implications for the full joint distribution of the data. But usually there are aspects of the environment (the distribution of preferences across consumers, or the exact functional form of technology) that we do not want to assert are true everywhere and for all time. From one point of view this is laziness, but it usually makes sense given the limitations of the data we have.


\par __What are the relative advantages and disadvantages of 'structural' as compared to 'reduced form' approaches to estimation?__

- The basic issues at stake are: 
    - the nature of the question: are we trying to estimate or test (some aspects of) an economic model, or are we just looking for a more loosely defined 'causal effect' which may combine many mechanisms?
    - are we interested in one specific causal effect in isolation - which allows us to treat the effects of all the _other_ causes of the outcome of interest as nuisance parameters? or, are we trying to evaluate the effects of several different causes simultaneously? Heckman (2008), "Econometric Causality" is a very useful discussion of these points.
    - relatedly, are we trying to estimate a parameter which is defined independently of the data (and risk misspecification), or do we want to isolate and characterize certain 'intuitive' aspects of the variation in the data? The former aims for 'external validity,' while the latter aims for 'internal validity'.
    - __examples?__
    - these goals are not mutually exclusive, but different audiences will prioritize one end of the spectrum over the other.
    - Some estimates computed via linear regression do have `'structural' interpretations, under some assumptions. See for example Amy Finkelstein's work, or even think of estimating the parameters of a Cobb-Douglas production function.
- A middle ground between structural and 'reduced-form' estimation is 'indirect inference' (also called 'simulated method of moments').
- One thing that 'structural' approaches can offer that pure 'causal analysis' cannot is the ability to make statements about welfare, optimal policy, etc. 
    - Of course, if you are skeptical about the correctness of the assumed model, you will also be skeptical about the reliability of the answers it produces.
    - A productive suggestion is Chetty (2009): try to estimate quantities that are relevant for interesting economic questions, and will be valid in a range of different models.
    - See also Weyl (2018) on the 'price-theoretic' tradition in microeconomics.
- A related point is that structural models, if correct, allow us to predict outside the range of the data.
    - Advocates of more "reduced-form" approaches are also sometimes willing to extrapolate.
    - A famous example was Daniel McFadden's prediction of the usage patterns for the BART system _before it had been built_. (As it happened, his predictions were quite accurate.)
    - Predictions and estimates are worthless without some (perhaps informal) sensitivity analysis and a discussion of their domain of validity. Standard errors are one aspect of this, but they are not the only one.

\par __Why isn't everyone a Bayesian? Isn't that obviously a better way to do estimation and inference? It seems much more natural, given that we typically have nonexperimental data, and we want to learn about which of our theories is more likely.__

- Maybe, but see the discussion of misspecification above.
- There are nonparametric things one can do that look sort of Bayesian, but for whatever reason they are not widely used. __examples?__
- One area where Bayesian inference is popular is in the parts of macro focused on the business cycle. See for example Uhlig's work, or Chris Sims'.
- Applied microeconomics, for better or worse, is overwhelmingly frequentist in its methods, so if you want to convince this audience, you have to speak their language.

\par __Why is overidentification so common in time series work but so rare in microeconometrics?__

- Because time series work is typically done by people in macro or finance, and they are willing to invoke rational expectations to get moment restrictions for estimation and testing.
- Because they are interested in estimating the parameters of economic models, and they are willing to put more structure on the problem. Typically that will be some type of intertemporal separability; an _a priori_ division of variables into those known by the agents and those that are not; and certain functional form assumptions on e.g. the marginal utility of consumption.
- An even deeper distinction is between general equilibrium, which is dominant in macro and finance (and trade), and partial equilibrium, which is the typical background assumption in labor or other areas of `'applied microeconomics'. The distinction matters because it determines what exclusion restrictions you want to impose, which will determine the set of plausible instruments you can use.
- if labor economists were willing to impose similar sorts of assumptions in their contexts (say on the distribution of unobserved ability or the shadow wage), and they were trying to estimate well-defined parameters, they would also get overidentification. The classic example here is the fully parametric normal Heckman selection model, which is formally identified even without instruments.
- "Data and assumptions are perfect substitutes" - Charles Manski

\par __What's the difference between a simultaneous-equations model and a single-equation model? Is it the same as the difference between 'structural' and 'reduced-form'?__

- No, and the term 'single-equation' can be pretty misleading.
- The usual IV setup is a simultaneous-equation model (of $y$ and $z$ as outcomes), although it is not typically thought of as a `structural' method of estimation.
- Simultaneous-equations models need not be 'structural' in the sense that their parameters do not have behavioral interpretations, and are not meant to be invariant to certain classes of policy interventions.
- Wooldridge, Ch 9 has a discussion of these issues.
- Sometimes (e.g. in Tom Sargent's work) you will read about 'cross-equation restrictions' which embody the empirical content of rational expectations. 
- I think it is better to ignore this distinction as an axis along which to classify empirical studies, and focus instead on the economics for which the estimation is supposed to be useful.
- For that matter, 'reduced-form' is not a hugely useful designation for an empirical study. 
    * It just conveys that the main results were computed by some sort of linear regression
    * But what sort of economic or 'causal' parameter are the estimates are supposed to approximate? As we have seen there are contexts and assumptions under which we can approximate meaningful, 'externally valid' economic parameters with certain regression coefficients.
    * On the other hand, if you know that the main estimates of a paper were computed using say maximum likelihood, it's almost certain that the authors have some explicit economic model they want to estimate or test.

\par __What is it that makes a given technique or estimator 'nonlinear'? I have heard statisticians refer to, e.g. a logit model as a 'generalized linear model'. On the other hand when people include polynomial terms in their regressions, it remains a 'linear' specification. What gives?__

- This is a reasonable question. People use the term 'nonlinear' to mean different things and it's not always clear whether nonlinearity is supposed to be good or bad, or for what reasons.
- One distinction is whether the regression is linear in the parameters or not. For example when the outcome of interest is a conditional mean (i.e. the loss function is quadratic) then the first-order conditions are linear in $\beta$. 
- Another sense in which OLS is 'linear' is that the estimates are a linear function of the outcome vector $y$.
- By contrast a Poisson regression is not linear in the parameters, although there is a transformation of the data (by taking logarithms) such that the conditional mean is linear in the coefficients.
- Overidentified IV (or GMM) does not lead to an estimator which is a linear function of the data. __example?__
- I advise you to just write down the equations defining the estimator, interpret them and assess the plausibility of the identifying assumptions, and solve them case-by-case.

\par __Surely there's more to data analysis than you've taught us? The latest release of STATA has many hundreds of built-in functions like ANOVA, etc. Shouldn't we know how to use them?__

- There is indeed more to data analysis than we can cover in this class.
- You should never use a statistical method without understanding what it does and what its limitations are.
- You shouldn't be estimating DSGE models in STATA. Go talk to your macro professors for guidance.
- If you want to do 'structural equation modelling' (which means something completely different to what it means in economics) either (1) figure out how to explain them to economists and why they are needed in your particular application, or (2) go talk to the sociologists.
- Besides, most if not all of those things can be done in R.


\par __Is econometrics ever successful? It seems like it's just a minefield.__

- It is, sort of. The world is complicated. Most importantly, people can change their behavior in response to their environment. That's why social science is hard.
- Still, there are a few great successes in empirical economics:
    * productivity measurement and price indices
    * dynamics of wage inequality
    * flow approach to labor markets
    * health insurance experiments
- There are probably a few important successes in macro and finance, but you'll have to ask someone else.
