# 2020-07-06 consultation

Kiun, David; Zoom

## Git

1. Clarified where git creates local clones
2. Added David as project contributor, with push access, on GitHub

## XML

Split XML file into three files:

1. Family members; `@addressee` begins with “Достоевск”
2. Other letters; `@addressee` does not begin with “Достоевск”
3. Other (not `<letter>`, no `@addressee`)

Implemented with `split-corpus.xsl`, which must be run against `dostoevsky_letters.xml`. Output files are written into *split-files* subdirectory, and can be addressed, together, with `collection()`.

## CSV

Create CSV output (*dostoevsky_letters.csv*) with three columns:

1. Addressor (always Dostoevsky)
2. Addressee
3. Count of letters sent by Addressor to Addressee

CSV values are quoted because some Addressee values contain commas, which, without quoting, would break the CSV parsing.

Verified that Cytoscape can import the CSV.

## XPath and XSLT technologies

* `<xsl:result-document>`
* Difference between `<xsl:copy>` and `<xsl:copy-if>`
* `<xsl:for-each-group>` (with `current-group()` and `current-grouping-key()`)
* User-defined function (`kiun:quote()`)
* `<xsl:output method="text">` (needed for CSV output)
* To create a newline character use `&#x0a;`