.section .text
.globl _start
.code16
_start:
read:
  movb  $2,%cl
  movb  $0,%dh
  movb	$0,%ch
  movb  $1,%al
  movb	$0,%dl
  movb  $2,%ah
  movw  $0x0100,%bx
  movw  %bx,%es
  movw  $0x0000,%bx
re_read:
  int	$0x13
  jc	re_read
print:
  movw  $0x0000,%si
  movw  $0x0100,%ax 
  movw  %ax,%ds
  cld
print_loop:
  lodsb
  cmpb  $0,%al
  je	print_done
  movb  $0x0e,%ah
  int	$0x10
  jmp	print_loop
print_done:
  ret

