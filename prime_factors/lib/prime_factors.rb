require 'prime'

class Fixnum
  def upto_primes(n)
    self.upto(n) do |d|
      if Prime.prime?(d)
        yield d
      end
    end
  end
end

class PrimeFactors
  def of(n)
    factors = []
    2.upto_primes(n) do |d|
      while n % d == 0 
        factors << d
        n = n / d
      end
    end
    factors
  end
end