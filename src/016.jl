# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
# What is the sum of the digits of the number 2^1000?

using ProjectEulerSolutions

# Simple with Julia's built-in BigInt and the digits function.
function p016solution(mantissa::Integer=2, exponent::Integer=3)::Integer
    return sum(digits(BigInt(mantissa) ^ exponent))
end

p016 = Problems.Problem(p016solution)

Problems.benchmark(p016, 2, 1000)