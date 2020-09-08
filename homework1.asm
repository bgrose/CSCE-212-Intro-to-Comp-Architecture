# C Code g = g - A[3] - 23

lw      $t0, 12($s0)         # load
sub    $t1, $s1, $t0        # g - A[3]
addi   $s1, $t1, -23		# g = $t1 - 23


# C Code A[i+1] = g + A[12] + 1

lw		  $t0, 48($s0)		  # load A[12]
add		$t1, $s1, $t0		# $t0 = g + $t0
addi	$t1, $t1, 1			  # $t1 = $t1 + 1
addi	$t2, $s2, 1			 # [i+1]
add		$t2, $t2, $t2		# 2[i+2]
add		$t2, $t2, $t2		# 4[i+2]
add		$t2, $s0, $t2		# Memory address for A[i+1]
sw		$t1, 0($t2)		     # Store A[i+1] <- $t1







