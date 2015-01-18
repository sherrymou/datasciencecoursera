complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    files<-list.files(directory, full.names=TRUE)
    k<-1
    
    for (i in id){
        tmp<-read.csv(files[i])
        stripped<-na.omit(tmp)
        num_row<-nrow(stripped)
        
        if(k==1){
            output<-data.frame(id=i,nobs=num_row)
        }
        else{        
        output<-rbind(output,c(i,num_row))
        }
        k<-k+1
    }
    output
}