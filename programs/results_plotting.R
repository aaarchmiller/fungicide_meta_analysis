#' # Results plotting
#' 
#' Also, analysis for the numbers reported in the paper (e.g., number of studies
#' and entries/study)
#' 
#' ### Preamble
#' 
#' Load Libraries
#+ libraries, messages=FALSE, warning=FALSE
library(ezknitr)
library(knitr)
library(devtools)
library(ggplot2)
library(ggthemes)
library(gridExtra)
library(cowplot)

#' Clear environment and set seed
#+ clear
remove(list=ls())
set.seed(776)

#' Document settings
#+ settings
opts_chunk$set(fig.width = 6, fig.height = 4, dev = "jpeg", dpi = 600)

#' ### Load data
#+ loadData
load(file="data/output_data/summary_results.R")

#' Update name of response variables
table(summary.means$Category)
summary.means$Category[summary.means$Category=="Rust"] <- "SBR"
summary.means$Category[summary.means$Category=="Seed Weight"] <- "100-sw"
table(summary.means$Category)

#' Separate by analysis
analysis.split <- split(summary.means, summary.means$Analysis)
category.split <- split(summary.means, summary.means$Category)

wide <- merge(category.split$SBR, category.split$Yield, by = "Moderator",all=T)
wide <- merge(wide, category.split$`100-sw`, by = "Moderator",all = T)

#' make 3-way comparison
new.wide.rust <- category.split$SBR
new.wide.y100 <- rbind(category.split$Yield, category.split$`100-sw`)
new.wide.yV100 <- merge(category.split$Yield, category.split$`100-sw`, all=T, by="Moderator")
new.wide.yV100$Comparison <- "Yield (X) vs 100-sw (Y)"
new.wide <- merge(new.wide.rust, new.wide.y100, by = "Moderator",all = T)
new.wide$Comparison[new.wide$Category.y=="100-sw"] <- "SBR (X) vs. 100-sw (Y)"
new.wide$Comparison[new.wide$Category.y=="Yield"] <- "SBR (X) vs. Yield (Y)"
new.wide.3way <- rbind(new.wide, new.wide.yV100)
new.wide.3way <- subset(new.wide.3way, !is.na(Comparison))
new.wide.3way <- subset(new.wide.3way, !is.na(Analysis.x))

################################################################################
#' ### 3-way scatter plot
#+ figure1, fig.width=8
# First, will want to annotate 2013 result in facet 2
annotate2013 <- data.frame(Comparison = "SBR (X) vs. Yield (Y)",
                           Mean.x = 0.44,
                           Mean.y = 1.1)
ggplot(data = new.wide.3way, 
       aes(x = Mean.x, y = Mean.y))+
  geom_point(colour="grey")+
  geom_errorbar(aes(ymin=LL.y, ymax=UL.y),colour="grey")+
  geom_errorbarh(aes(xmin=LL.x, xmax=UL.x),colour="grey")+
  geom_errorbar(data = new.wide.3way[new.wide.3way$Analysis.x=="Overall Mean",],
                aes(ymin=LL.y,ymax=UL.y),colour="black",width=0)+
  geom_errorbarh(data = new.wide.3way[new.wide.3way$Analysis.x=="Overall Mean",],
                 aes(xmin=LL.x,xmax=UL.x),colour="black",height=0)+
  geom_point(data = new.wide.3way[new.wide.3way$Analysis.x=="Overall Mean",],
             colour="black",size=2)+
  theme_bw()+
  theme(axis.line = element_line())+
  ylab("Response ratio (95% C.I.)")+
  xlab("Response ratio (95% C.I.)")+
  facet_wrap(~Comparison, scales = "free")+
  geom_text(data = annotate2013, label = "2013", family="serif")+
  scale_y_continuous(limits=c(1,1.5))+
  theme(panel.grid = element_blank())

#' ### Main results
#' 
pd <- position_dodge(width=0.3)
#' Active Ingredient and Fungicide Class
#+ figure2, fig.width=8
annotateAI <- data.frame(Mean = 1.6, Moderator = "FLUT", Category="SBR")
p1 <- ggplot(data = summary.means[summary.means$Analysis=="Active Ingredient",], 
             aes(x = Moderator, y = Mean, colour=Category, shape=Category))+
  geom_pointrange(aes(ymin = LL, ymax = UL), position=pd)+
  geom_hline(aes(yintercept=1), colour="grey")+
  scale_x_discrete(limits=c("FLUT","PYR","TEBU","MIXED","AZO_PROP"), 
                   labels=c("FLUT","PYR","TEBU","Mixed","AZO + \nPROP"))+
  xlab("Active ingredient")+
  ylab("")+
  ylim(c(0,1.7))+
  theme_bw()+
  theme(legend.position = "none")+
  geom_text(data = annotateAI, label="B")+
  scale_shape_manual(limits = c("SBR", "100-sw", "Yield"), values = c(20,17,15))+
  scale_color_manual(limits = c("SBR", "100-sw", "Yield"), values = c("#000000","#FC575E","#44BBFF"))+
  theme(panel.grid = element_blank())

annotateClass <- data.frame(Mean = 1.6, Moderator = "OVERALL", Category = "SBR")
p2 <- ggplot(data = summary.means[summary.means$Analysis=="Fungicide Class"|
                                    summary.means$Moderator=="OVERALL",], 
             aes(x = Moderator, y = Mean))+
  geom_pointrange(aes(ymin = LL, ymax = UL, colour=Category, shape=Category), position=pd)+
  geom_hline(aes(yintercept=1), colour="grey")+
  geom_vline(aes(xintercept=1.5), colour="grey")+
  scale_x_discrete(limits=c("OVERALL","Strobilurin", "Triazole", "Triaz_Strob"), 
                   labels=c("Overall","Strobilurin", "Triazole", "Mixed Triazole\n& Strobilurin"))+
  ylab("Response ratio (95% C.I.)")+
  xlab("Fungicide class")+
  ylim(c(0,1.7))+
  theme_bw()+
  theme(legend.position = "none")+
  geom_text(data = annotateClass, label="A")+
  scale_shape_manual(limits = c("SBR", "100-sw", "Yield"), values = c(20,17,15))+
  scale_color_manual(limits = c("SBR", "100-sw", "Yield"), values = c("#000000","#FC575E","#44BBFF"))+
  theme(panel.grid = element_blank(),
        legend.title = element_blank(),
        legend.position = c(0.75,0.4))

grid.arrange(p2, p1, ncol=2)

#' Disease Pressure, Growth Stage, and Applications
#+ figure3, fig.width=8
annotatePress <- data.frame(Mean = 1.6, Moderator = "low", Category="SBR")
p3 <- ggplot(data = summary.means[summary.means$Analysis=="Disease Pressure",], 
       aes(x = Moderator, y = Mean, colour=Category, shape=Category))+
  geom_pointrange(aes(ymin = LL, ymax = UL), position=pd)+
  geom_hline(aes(yintercept=1), colour="grey")+
  scale_x_discrete(limits=c("low","medium","high"), 
                   labels=c("Low","Medium","High"))+
  ylab("")+
  xlab("Disease pressure")+
  theme_bw()+
  theme(legend.position = "none")+
  geom_text(data = annotatePress, label="C")+
  scale_shape_manual(limits = c("SBR", "100-sw", "Yield"), values = c(20,17,15))+
  scale_color_manual(limits = c("SBR", "100-sw", "Yield"), values = c("#000000","#FC575E","#44BBFF"))+
  theme(panel.grid = element_blank())

annotateRstage <- data.frame(Mean = 1.6, Moderator = "R1+", Category="SBR")
p4 <- ggplot(data = summary.means[summary.means$Analysis=="Growth Stage",], 
       aes(x = Moderator, y = Mean, colour=Category, shape=Category))+
  geom_pointrange(aes(ymin = LL, ymax = UL), position=pd)+
  geom_hline(aes(yintercept=1), colour="grey")+
  scale_x_discrete(limits=c("R1+","R2+","R3","R5"), 
                   labels=c("R1+","R2+","R3","R5"))+
  ylab("")+
  xlab("Growth stage")+
  theme_bw()+
  theme(legend.position = "none")+
  geom_text(data = annotateRstage, label="B")+
  scale_shape_manual(limits = c("SBR", "100-sw", "Yield"), values = c(20,17,15))+
  scale_color_manual(limits = c("SBR", "100-sw", "Yield"), values = c("#000000","#FC575E","#44BBFF"))+
  theme(panel.grid = element_blank())

annotateApps <- data.frame(Mean = 1.6, Moderator = "OVERALL", Category="SBR")
p5 <- ggplot(data = summary.means[summary.means$Analysis=="Applications"|
                              summary.means$Moderator=="OVERALL",], 
       aes(x = Moderator, y = Mean))+
  geom_pointrange(aes(ymin = LL, ymax = UL, colour=Category, shape=Category), position=pd)+
  geom_hline(aes(yintercept=1), colour="grey")+
  geom_vline(aes(xintercept=1.5), colour="grey")+
  scale_x_discrete(limits=c("OVERALL","1 Application","2 Applications"), 
                   labels=c("Overall","1","2"))+
  ylab("Response ratio (95% C.I.)")+
  xlab("Applications")+
  theme_bw()+
  geom_text(data = annotateApps, label="A")+
  scale_shape_manual(limits = c("SBR", "100-sw", "Yield"), values = c(20,17,15))+
  scale_color_manual(limits = c("SBR", "100-sw", "Yield"), values = c("#000000","#FC575E","#44BBFF"))+
  #theme(legend.position = "none")+
  #guides(colour = guide_legend(override.aes = list(shape = c(20,17,15))))+
  theme(panel.grid = element_blank(),
        legend.title = element_blank(),
        legend.position = c(0.75,0.4))

grid.arrange(p5, p4, p3, ncol=3)

#' Study Year
#+ figure4
ggplot(data = summary.means[summary.means$Analysis=="Study Year"|
                              summary.means$Moderator=="OVERALL",], 
       aes(x = Moderator, y = Mean, colour=Category, shape=Category))+
  geom_pointrange(aes(ymin = LL, ymax = UL), position=pd)+
  geom_hline(aes(yintercept=1), colour="grey")+
  geom_vline(aes(xintercept=1.5), colour="grey")+
  scale_x_discrete(limits=c("OVERALL","2006","2007","2008","2009","2010","2011","2012","2013"), 
                   labels=c("Overall","2006","2007","2008","2009","2010","2011","2012","2013"))+
  ylab("Response ratio (95% C.I.)")+
  xlab("Study year")+
  theme_bw()+
  theme(legend.position = "none")+
  scale_shape_manual(limits = c("SBR", "100-sw", "Yield"), values = c(20,17,15))+
  scale_color_manual(limits = c("SBR", "100-sw", "Yield"), values = c("#000000","#FC575E","#44BBFF"))+
  #theme(legend.position = "none")+
  #guides(colour = guide_legend(override.aes = list(shape = c(20,17,15))))+
  theme(panel.grid = element_blank(),
        legend.title = element_blank(),
        legend.position = c(0.75,0.8))



#' ### Footer
#' 
#' Spun with ezspin("programs/results_plotting.R", out_dir="output", fig_dir="figures", keep_md=FALSE)
#' 
#' Session Info:
#+ sessionInfo
devtools::session_info()