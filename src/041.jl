# We shall say that an n-digit number is pandigital if it makes use of all the
# digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is
# also prime.
#
# What is the largest n-digit pandigital prime that exists?

include("Problems.jl")
include("prime.jl")

# Creates pandigital permutations, and tests for primality.  Pandigitals of
# length 8 and 9 are divisible by 3 and thus cannot be prime.
function p041solution_permutation()::Integer
    for n in 7:-1:1
        primeval = first_permuted_prime(collect(1:n), 10 .^ (0:n-1))
        if primeval > 0
            return primeval
        end
    end
    return -1
end

# Brute force solution, checking every prime up to 7,654,321, since all
# pandigitals of length 8 and 9 are divisible by 3 and thus cannot be prime.
function p041solution_seive()::Integer

    n = 7_654_321
    primes = seive_eratosthenes(n)
    max_pandigital_prime = 2143
    lower_bound = 1e6

    for p in primes
        digs = digits(p)
        # max digit = length, min digit = 1, and every digit unique
        if length(digs) == maximum(digs) && minimum(digs) == 1 && length(Set(digs)) == length(digs)
            max_pandigital_prime = p
        end
    end

    return max_pandigital_prime
end

p041 = Problems.Problem(Dict("permutation" => p041solution_permutation,
                             "seive" => p041solution_seive))

Problems.benchmark(p041)