# StrainCode

A gem for parsing and formatting strain numbers
from microbiological culture collections

## Installation

```bash
gem install strain-code
```

## Usage

```ruby
require 'strain-code'

# Parse one or more numbers in a variety of formats
str_no = StrainCode.parse <<STR_NO
  ATCC 33152  = CCUG 9568  = CIP 103854  ;
  DSM 25069  = DSM_7513  = JCM:7571;
  NBIMCC:8848 = NCTC 11192, Strain Philadelphia 1
STR_NO

# Get the URLs to the entry in the corresponding catalogues
str_no.map(&:url)

# Get the name and country of each catalogue (if available)
str_no.map(&:catalogue).map { |i| [i.name, i.country_code] if i }
```

