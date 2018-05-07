
#
install.packages(swirl)
library(swirl)

install_course_zip("C:/swirl_courses-master.zip", multi = TRUE, which_course = "Stastical_inference")

swirl()

swirl::install_course()

install_course("Stastical Inference")

# class on 2nd May Practice

install.packages(swirl)
library(swirl)

install_course_zip("C:/swirl_courses-master.zip", multi = TRUE, which_course = "Open Intro")

swirl()

swirl::install_course()

install_course("Stastical Inference")

# find out the n number with accuracy .8, .9 whatever you need
library("pwr")
power_changes <- pwr.p.test(h = ES.h(p1 = 0.75, p2 = 0.50), sig.level = 0.01, power = 0.80, alternative = 'greater')
plot(power_changes)

# find out the n number we need to get the required to avoid type 2 error, so if we have sig level .1 we are almost 100%


power_changes <- pwr.p.test(h = ES.h(p1 = 0.75, p2 = 0.50), sig.level = 0.01, n = 40, alternative = 'greater')
plot(power_changes)

power_changes <- pwr.p.test(h = ES.h(p1 = 0.65, p2 = 0.50), sig.level = 0.05, power=0.80)
plot(power_changes)


? cohen.ES

effect_size <- pwr.r.test(r = cohen.ES(test = "r", size = "medium")(effect_size$effect.size, power = 0.80, sig.level = 0.05))


effect_size <- pwr.r.test(r = cohen.ES(test = "r", size = "medium")(effect_size$effect.size, power = 0.80, sig.level = 0.05))



pwr.p.test(h = c(0.2, 0.5, 0.8), n = 20, sig.level = 0.05)


pwr.p.test(h = c(0.8), n = 20, sig.level = 0.05)



new_test <- pwr.2p.test(h = ES.h(p1 = 0.55, p2 = 0.50), sig.level = 0.05, power = 0.80)
plot(new_test)

new_test2 <- pwr.2p.test(h = ES.h(p1 = 0.55, p2 = 0.50), sig.level = 0.05, power = 0.80)
plot(new_test2)
