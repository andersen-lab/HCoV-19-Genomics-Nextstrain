"""
Combine fastas from SEARCH repository"
"""
import os
import argparse
from fnmatch import fnmatch
from Bio import SeqIO
import pandas as pd

# Basic metadata will be Accession_CollectionDate_Country/Division
def generate_name( line ):
    line_split = line.split( "," )
    
    return "_".join( [line_split[0], line_split[3], line_split[4]] )

if __name__ == "__main__":
    parser = argparse.ArgumentParser( 
        description="Combine fastas from SEARCH repository",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )
    
    parser.add_argument( "--input", required=True, help="Location of SEARCH Repository" )
    parser.add_argument( "--output", required=True, help="FASTA file containing concatenated sequences" )
    args = parser.parse_args()

    fasta_location = os.path.join( args.input, "consensus_sequences" )

    input_files = [i for i in os.listdir( fasta_location ) if (fnmatch( i, "*.fa" ) or fnmatch( i, "*.fasta" ) )]
    md_dict = dict()
    with open( os.path.join( args.input, "metadata.csv" ), "r" ) as metadata: 
        for entry in metadata:
            md_dict[entry.split( "," )[0]] = generate_name( entry )
   
    records = list()

    for ifile in input_files:
        file_location = os.path.join( fasta_location, ifile )
        record = SeqIO.read( file_location, "fasta" )
        record.id = md_dict[os.path.splitext( ifile )[0]]
        record.description = ""
        records.append( record )

    SeqIO.write( records, args.output, "fasta" )

    # Quickly rewrite metadata csv as tsv
    metadata = pd.read_csv( os.path.join( args.input, "metadata.csv" ) )
    metadata.to_csv( os.path.join( args.input, "metadata.tsv" ), delimiter="\t" )
