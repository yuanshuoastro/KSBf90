module permutation_routines
implicit none

contains

integer function factorial(n)
  integer::n

  integer::count

  factorial = 1
  do count = n, 1, -1
     factorial = factorial*count
  end do
  return
end function factorial


  recursive subroutine permutate(E, P)
    integer, intent(in)  :: E(:)       ! array of objects                                             
    integer, intent(out) :: P(:,:)     ! permutations of E                                           
    integer  :: N, Nfac, i, k, S(size(P,1)/size(E), size(E)-1)

    if(size(P,1) /= factorial(size(E))) stop 'Permutate - FATAL ERROR -the array of permutations (P) does not have the correct first dimension'
    if(size(P,2) /= (size(E))) stop 'Permutate - FATAL ERROR -the array of permutations (P) does not have the correct second dimension'

    N = size(E); Nfac = size(P,1);
    do i=1,N                           ! cases with E(i) in front                                     
      if( N>1 ) call permutate((/E(:i-1), E(i+1:)/), S)
      forall(k=1:Nfac/N) P((i-1)*Nfac/N+k,:) = (/E(i), S(k,:)/)
    end do
  end subroutine permutate


end module permutation_routines
