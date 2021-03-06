# Zone file for example.com (example file)

# The SOA record must be first, followed by all authoritative NS 
# records for this zone.
Sexample.com.|86400|example.com.|hostmaster@example.com.|19771108|7200|3600|604800|1800
Nexample.com.|86400|ns1.example.com.
Nexample.com.|86400|ns2.example.com.

# Some 'IN A' records
Aexample.com.|86400|10.1.2.3
Amx.example.com.|86400|10.1.2.4
Ans1.example.com.|86400|10.0.0.1
Ans2.example.com.|86400|192.168.0.1

# An 'IN MX' record
@example.com.|86400|10|mx.example.com.

# An 'IN CNAME' record
Cwww.example.com.|86400|example.com.

# An 'IN TXT' record
Texample.com.|86400|example.com: Buy examples of products online!

# An 'A' record showing the use of percent as a shortcut for the name
# of this zone (in this case, 'example.com.')
Aftp.%|3600|10.7.8.9

# A 'TXT' record showing the use of the backslash which allows any 
# octal code in the record
Tpercent.%|7200|Get 50\045 off all \%items\% at example.com!
 
# A 'PTR' record which, while marked as unauthoritative, allows this
# program to work with the obsolete tool nslookup when bound on IP 127.0.0.3
# NOTE: This record is not part of the example.com domain, and,
# therefore, can not be transferred with the getzone client
P3.0.0.127.in-addr.arpa.|1234|nslookup.bug.workaround.