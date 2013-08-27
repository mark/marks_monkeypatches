## Mark's Monkeypatches

Everybody has a different collection of methods that they feel Ruby's Stdlib and Corelib left out.  This repository is mine.  Hey, sometimes you gotta patch the monkeys, knamean?

### Array Methods

##### Array#many?

Returns true if array has more than 1 element.  If you pass in a block, it returns true if more than 1 element evaluates to true.

##### Array#rest?

Returns elements except #first

##### Array#subsets

Returns an array of all subsets of this array.

##### Array#transform(other_array)

Calls the block, passing in an array transformer.

### Comparable Methods

##### Comparable#max(other)

Returns the greater of self and other.

##### Comparable#min(other)

Returns the lesser of self and other.

### Custom Classes

#### Duck

A duck is an object with a list of method names.  It responds to `#===(obj)` and `#quack?(obj)`, and returns true if `obj` responds to all of those methods.

#### ArrayTransformer

An array transformer manages replacing one array with another.  A call to `#insert` will yield each object inserted, and `#remove` will yield each object removed.  It has a lot more methods.

#### DateRange

A `DateRange` is a custom class representing a span of dates.  It has multiple methods.

### Date Methods

##### Date#cal

Prints a calendar similar to the unix `cal` command.

##### Date#days_in_month

Returns the number of days in the month of this date.

##### Date#day_of

Returns a `DateRange` from this date to this date.

##### Date#end_of_month

Returns the last day of this date's month.

##### Date#end_of_week

Returns the the last day of this date's week (a Saturday).

##### Date#month_of

Returns a `DateRange` from the first day of this date's month, to the last day of this date's month.

##### Date#start_of_month

Returns the first day of this date's month.

##### Date#start_of_week

Returns the first day of this date's week (a Sunday).

##### Date#week_of

Returns a `DateRange` from the start of this date's week, to the end of this date's week.

### Enumerable Methods

##### Enumerable#hashify

Creates a hash by iterating over the enumerable, passing each element to the block in turn.  The results are used as keys to the hash, and the original enumerable becomes the values.

##### Enumerable#reverse_hashify

Creates a hash by iterating over the enumerable, passing each element to the block in turn.  The enumerated items are used as keys to the hash, and the block results becomes the values.

##### Enumerable#double_hashify

### Hash Methods

##### Hash::of

Returns a new hash where each keys maps to an instance of what the block returns.

##### Hash::of_arrays

Return a new hash where each key maps to a different array.

##### Hash::of_hashes

Returns a new hash where each key maps to a different hash.

##### Hash::of_numbers

Returns a new hash where each key maps to a different number.

##### Hash#except(*keys)

Creates a new hash with all keys except the keys in the list provided.

##### Hash#extract(*keys)

Creates a new hash from self with the keys in the list provided.  Those keys are then removed from self.

##### Hash#only(*keys)

Creates a new hash with only the keys included in the list provided.

##### Hash#resolve(other_hash)

Merges self with other hash.  In the event that a key is defined in both hashes, with different values, then the block is called, passing in the key, self's value, and other_hash's value.  The result is used as the value in the new hash.

### Kernel Methods

##### duck(*methods)

Return a new duck type on the given keys.

### Object Methods

##### Object#another(*args, &block)

Will call `.new` on the object's class, passing in the arguments and block to the constructor.

##### Object#duck?(*methods)

##### Object#falsy

Yields if self is falsy (false or nil).

##### Object#in?(container)

Returns true if container `#cover?`s or `#include?`s self.

##### Object#present?

Opposite of `#nil?`

##### Object#required!

Returns self unless self is `#nil?`, in which case it yields and returns the result.

##### Object#to_b

Returns true if self is truthy; false if self is falsy.

##### Object#truthy

Yields is self is truthy (anything except false or nil).

### Struct Methods

##### Struct#make(array)

Creates a new instance of a struct with the arguments in the array.

##### Struct#parse(filename, options = {})

Parses the provided file as a .csv, making new instances of this struct from the rows.

Options:
* `:skip_header` — if true, ignores the first row.

