
encoder:     file format elf64-x86-64


Disassembly of section .init:

0000000000400df0 <_init>:
  400df0:	48 83 ec 08          	sub    $0x8,%rsp
  400df4:	48 8b 05 fd 21 20 00 	mov    0x2021fd(%rip),%rax        # 602ff8 <_DYNAMIC+0x200>
  400dfb:	48 85 c0             	test   %rax,%rax
  400dfe:	74 05                	je     400e05 <_init+0x15>
  400e00:	e8 0b 02 00 00       	callq  401010 <_ZNSt8ios_base4InitD1Ev@plt+0x10>
  400e05:	48 83 c4 08          	add    $0x8,%rsp
  400e09:	c3                   	retq   

Disassembly of section .plt:

0000000000400e10 <__printf_chk@plt-0x10>:
  400e10:	ff 35 f2 21 20 00    	pushq  0x2021f2(%rip)        # 603008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400e16:	ff 25 f4 21 20 00    	jmpq   *0x2021f4(%rip)        # 603010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400e1c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400e20 <__printf_chk@plt>:
  400e20:	ff 25 f2 21 20 00    	jmpq   *0x2021f2(%rip)        # 603018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400e26:	68 00 00 00 00       	pushq  $0x0
  400e2b:	e9 e0 ff ff ff       	jmpq   400e10 <_init+0x20>

0000000000400e30 <_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_@plt>:
  400e30:	ff 25 ea 21 20 00    	jmpq   *0x2021ea(%rip)        # 603020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400e36:	68 01 00 00 00       	pushq  $0x1
  400e3b:	e9 d0 ff ff ff       	jmpq   400e10 <_init+0x20>

0000000000400e40 <omTensorGetDataPtr@plt>:
  400e40:	ff 25 e2 21 20 00    	jmpq   *0x2021e2(%rip)        # 603028 <_GLOBAL_OFFSET_TABLE_+0x28>
  400e46:	68 02 00 00 00       	pushq  $0x2
  400e4b:	e9 c0 ff ff ff       	jmpq   400e10 <_init+0x20>

0000000000400e50 <__cxa_begin_catch@plt>:
  400e50:	ff 25 da 21 20 00    	jmpq   *0x2021da(%rip)        # 603030 <_GLOBAL_OFFSET_TABLE_+0x30>
  400e56:	68 03 00 00 00       	pushq  $0x3
  400e5b:	e9 b0 ff ff ff       	jmpq   400e10 <_init+0x20>

0000000000400e60 <omTensorCreate@plt>:
  400e60:	ff 25 d2 21 20 00    	jmpq   *0x2021d2(%rip)        # 603038 <_GLOBAL_OFFSET_TABLE_+0x38>
  400e66:	68 04 00 00 00       	pushq  $0x4
  400e6b:	e9 a0 ff ff ff       	jmpq   400e10 <_init+0x20>

0000000000400e70 <strlen@plt>:
  400e70:	ff 25 ca 21 20 00    	jmpq   *0x2021ca(%rip)        # 603040 <_GLOBAL_OFFSET_TABLE_+0x40>
  400e76:	68 05 00 00 00       	pushq  $0x5
  400e7b:	e9 90 ff ff ff       	jmpq   400e10 <_init+0x20>

0000000000400e80 <memcmp@plt>:
  400e80:	ff 25 c2 21 20 00    	jmpq   *0x2021c2(%rip)        # 603048 <_GLOBAL_OFFSET_TABLE_+0x48>
  400e86:	68 06 00 00 00       	pushq  $0x6
  400e8b:	e9 80 ff ff ff       	jmpq   400e10 <_init+0x20>

0000000000400e90 <_ZSt19__throw_logic_errorPKc@plt>:
  400e90:	ff 25 ba 21 20 00    	jmpq   *0x2021ba(%rip)        # 603050 <_GLOBAL_OFFSET_TABLE_+0x50>
  400e96:	68 07 00 00 00       	pushq  $0x7
  400e9b:	e9 70 ff ff ff       	jmpq   400e10 <_init+0x20>

0000000000400ea0 <aligned_alloc@plt>:
  400ea0:	ff 25 b2 21 20 00    	jmpq   *0x2021b2(%rip)        # 603058 <_GLOBAL_OFFSET_TABLE_+0x58>
  400ea6:	68 08 00 00 00       	pushq  $0x8
  400eab:	e9 60 ff ff ff       	jmpq   400e10 <_init+0x20>

0000000000400eb0 <memcpy@plt>:
  400eb0:	ff 25 aa 21 20 00    	jmpq   *0x2021aa(%rip)        # 603060 <_GLOBAL_OFFSET_TABLE_+0x60>
  400eb6:	68 09 00 00 00       	pushq  $0x9
  400ebb:	e9 50 ff ff ff       	jmpq   400e10 <_init+0x20>

0000000000400ec0 <__cxa_atexit@plt>:
  400ec0:	ff 25 a2 21 20 00    	jmpq   *0x2021a2(%rip)        # 603068 <_GLOBAL_OFFSET_TABLE_+0x68>
  400ec6:	68 0a 00 00 00       	pushq  $0xa
  400ecb:	e9 40 ff ff ff       	jmpq   400e10 <_init+0x20>

0000000000400ed0 <_ZdlPv@plt>:
  400ed0:	ff 25 9a 21 20 00    	jmpq   *0x20219a(%rip)        # 603070 <_GLOBAL_OFFSET_TABLE_+0x70>
  400ed6:	68 0b 00 00 00       	pushq  $0xb
  400edb:	e9 30 ff ff ff       	jmpq   400e10 <_init+0x20>

0000000000400ee0 <fclose@plt>:
  400ee0:	ff 25 92 21 20 00    	jmpq   *0x202192(%rip)        # 603078 <_GLOBAL_OFFSET_TABLE_+0x78>
  400ee6:	68 0c 00 00 00       	pushq  $0xc
  400eeb:	e9 20 ff ff ff       	jmpq   400e10 <_init+0x20>

0000000000400ef0 <_Znwm@plt>:
  400ef0:	ff 25 8a 21 20 00    	jmpq   *0x20218a(%rip)        # 603080 <_GLOBAL_OFFSET_TABLE_+0x80>
  400ef6:	68 0d 00 00 00       	pushq  $0xd
  400efb:	e9 10 ff ff ff       	jmpq   400e10 <_init+0x20>

0000000000400f00 <_ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base@plt>:
  400f00:	ff 25 82 21 20 00    	jmpq   *0x202182(%rip)        # 603088 <_GLOBAL_OFFSET_TABLE_+0x88>
  400f06:	68 0e 00 00 00       	pushq  $0xe
  400f0b:	e9 00 ff ff ff       	jmpq   400e10 <_init+0x20>

0000000000400f10 <__stack_chk_fail@plt>:
  400f10:	ff 25 7a 21 20 00    	jmpq   *0x20217a(%rip)        # 603090 <_GLOBAL_OFFSET_TABLE_+0x90>
  400f16:	68 0f 00 00 00       	pushq  $0xf
  400f1b:	e9 f0 fe ff ff       	jmpq   400e10 <_init+0x20>

0000000000400f20 <fopen@plt>:
  400f20:	ff 25 72 21 20 00    	jmpq   *0x202172(%rip)        # 603098 <_GLOBAL_OFFSET_TABLE_+0x98>
  400f26:	68 10 00 00 00       	pushq  $0x10
  400f2b:	e9 e0 fe ff ff       	jmpq   400e10 <_init+0x20>

0000000000400f30 <omTensorListGetOmtByIndex@plt>:
  400f30:	ff 25 6a 21 20 00    	jmpq   *0x20216a(%rip)        # 6030a0 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400f36:	68 11 00 00 00       	pushq  $0x11
  400f3b:	e9 d0 fe ff ff       	jmpq   400e10 <_init+0x20>

0000000000400f40 <omTensorListCreate@plt>:
  400f40:	ff 25 62 21 20 00    	jmpq   *0x202162(%rip)        # 6030a8 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400f46:	68 12 00 00 00       	pushq  $0x12
  400f4b:	e9 c0 fe ff ff       	jmpq   400e10 <_init+0x20>

0000000000400f50 <malloc@plt>:
  400f50:	ff 25 5a 21 20 00    	jmpq   *0x20215a(%rip)        # 6030b0 <_GLOBAL_OFFSET_TABLE_+0xb0>
  400f56:	68 13 00 00 00       	pushq  $0x13
  400f5b:	e9 b0 fe ff ff       	jmpq   400e10 <_init+0x20>

0000000000400f60 <__cxa_rethrow@plt>:
  400f60:	ff 25 52 21 20 00    	jmpq   *0x202152(%rip)        # 6030b8 <_GLOBAL_OFFSET_TABLE_+0xb8>
  400f66:	68 14 00 00 00       	pushq  $0x14
  400f6b:	e9 a0 fe ff ff       	jmpq   400e10 <_init+0x20>

0000000000400f70 <fread@plt>:
  400f70:	ff 25 4a 21 20 00    	jmpq   *0x20214a(%rip)        # 6030c0 <_GLOBAL_OFFSET_TABLE_+0xc0>
  400f76:	68 15 00 00 00       	pushq  $0x15
  400f7b:	e9 90 fe ff ff       	jmpq   400e10 <_init+0x20>

0000000000400f80 <_ZNSt8ios_base4InitC1Ev@plt>:
  400f80:	ff 25 42 21 20 00    	jmpq   *0x202142(%rip)        # 6030c8 <_GLOBAL_OFFSET_TABLE_+0xc8>
  400f86:	68 16 00 00 00       	pushq  $0x16
  400f8b:	e9 80 fe ff ff       	jmpq   400e10 <_init+0x20>

0000000000400f90 <run_main_graph@plt>:
  400f90:	ff 25 3a 21 20 00    	jmpq   *0x20213a(%rip)        # 6030d0 <_GLOBAL_OFFSET_TABLE_+0xd0>
  400f96:	68 17 00 00 00       	pushq  $0x17
  400f9b:	e9 70 fe ff ff       	jmpq   400e10 <_init+0x20>

0000000000400fa0 <puts@plt>:
  400fa0:	ff 25 32 21 20 00    	jmpq   *0x202132(%rip)        # 6030d8 <_GLOBAL_OFFSET_TABLE_+0xd8>
  400fa6:	68 18 00 00 00       	pushq  $0x18
  400fab:	e9 60 fe ff ff       	jmpq   400e10 <_init+0x20>

0000000000400fb0 <__cxa_end_catch@plt>:
  400fb0:	ff 25 2a 21 20 00    	jmpq   *0x20212a(%rip)        # 6030e0 <_GLOBAL_OFFSET_TABLE_+0xe0>
  400fb6:	68 19 00 00 00       	pushq  $0x19
  400fbb:	e9 50 fe ff ff       	jmpq   400e10 <_init+0x20>

0000000000400fc0 <__gxx_personality_v0@plt>:
  400fc0:	ff 25 22 21 20 00    	jmpq   *0x202122(%rip)        # 6030e8 <_GLOBAL_OFFSET_TABLE_+0xe8>
  400fc6:	68 1a 00 00 00       	pushq  $0x1a
  400fcb:	e9 40 fe ff ff       	jmpq   400e10 <_init+0x20>

0000000000400fd0 <_Unwind_Resume@plt>:
  400fd0:	ff 25 1a 21 20 00    	jmpq   *0x20211a(%rip)        # 6030f0 <_GLOBAL_OFFSET_TABLE_+0xf0>
  400fd6:	68 1b 00 00 00       	pushq  $0x1b
  400fdb:	e9 30 fe ff ff       	jmpq   400e10 <_init+0x20>

0000000000400fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@plt>:
  400fe0:	ff 25 12 21 20 00    	jmpq   *0x202112(%rip)        # 6030f8 <_GLOBAL_OFFSET_TABLE_+0xf8>
  400fe6:	68 1c 00 00 00       	pushq  $0x1c
  400feb:	e9 20 fe ff ff       	jmpq   400e10 <_init+0x20>

0000000000400ff0 <__libc_start_main@plt>:
  400ff0:	ff 25 0a 21 20 00    	jmpq   *0x20210a(%rip)        # 603100 <_GLOBAL_OFFSET_TABLE_+0x100>
  400ff6:	68 1d 00 00 00       	pushq  $0x1d
  400ffb:	e9 10 fe ff ff       	jmpq   400e10 <_init+0x20>

0000000000401000 <_ZNSt8ios_base4InitD1Ev@plt>:
  401000:	ff 25 02 21 20 00    	jmpq   *0x202102(%rip)        # 603108 <_GLOBAL_OFFSET_TABLE_+0x108>
  401006:	68 1e 00 00 00       	pushq  $0x1e
  40100b:	e9 00 fe ff ff       	jmpq   400e10 <_init+0x20>

Disassembly of section .plt.got:

0000000000401010 <.plt.got>:
  401010:	ff 25 e2 1f 20 00    	jmpq   *0x201fe2(%rip)        # 602ff8 <_DYNAMIC+0x200>
  401016:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000401020 <_Z41__static_initialization_and_destruction_0ii.constprop.0.cold>:
  401020:	48 8d 9c 24 68 02 00 	lea    0x268(%rsp),%rbx
  401027:	00 
  401028:	48 83 eb 28          	sub    $0x28,%rbx
  40102c:	48 8b 3b             	mov    (%rbx),%rdi
  40102f:	48 8d 43 10          	lea    0x10(%rbx),%rax
  401033:	48 39 c7             	cmp    %rax,%rdi
  401036:	74 05                	je     40103d <_Z41__static_initialization_and_destruction_0ii.constprop.0.cold+0x1d>
  401038:	e8 93 fe ff ff       	callq  400ed0 <_ZdlPv@plt>
  40103d:	48 39 eb             	cmp    %rbp,%rbx
  401040:	75 e6                	jne    401028 <_Z41__static_initialization_and_destruction_0ii.constprop.0.cold+0x8>
  401042:	4c 89 e7             	mov    %r12,%rdi
  401045:	e8 86 ff ff ff       	callq  400fd0 <_Unwind_Resume@plt>
  40104a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>:
  401050:	41 55                	push   %r13
  401052:	4c 8d 6f 10          	lea    0x10(%rdi),%r13
  401056:	41 54                	push   %r12
  401058:	55                   	push   %rbp
  401059:	48 89 f5             	mov    %rsi,%rbp
  40105c:	53                   	push   %rbx
  40105d:	48 89 fb             	mov    %rdi,%rbx
  401060:	48 83 ec 18          	sub    $0x18,%rsp
  401064:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40106b:	00 00 
  40106d:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  401072:	31 c0                	xor    %eax,%eax
  401074:	4c 89 2f             	mov    %r13,(%rdi)
  401077:	48 89 f7             	mov    %rsi,%rdi
  40107a:	e8 f1 fd ff ff       	callq  400e70 <strlen@plt>
  40107f:	48 89 04 24          	mov    %rax,(%rsp)
  401083:	49 89 c4             	mov    %rax,%r12
  401086:	48 83 f8 0f          	cmp    $0xf,%rax
  40108a:	77 3e                	ja     4010ca <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0+0x7a>
  40108c:	48 83 f8 01          	cmp    $0x1,%rax
  401090:	75 31                	jne    4010c3 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0+0x73>
  401092:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
  401096:	88 43 10             	mov    %al,0x10(%rbx)
  401099:	48 8b 04 24          	mov    (%rsp),%rax
  40109d:	48 8b 13             	mov    (%rbx),%rdx
  4010a0:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4010a4:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
  4010a8:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  4010ad:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4010b4:	00 00 
  4010b6:	75 3d                	jne    4010f5 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0+0xa5>
  4010b8:	48 83 c4 18          	add    $0x18,%rsp
  4010bc:	5b                   	pop    %rbx
  4010bd:	5d                   	pop    %rbp
  4010be:	41 5c                	pop    %r12
  4010c0:	41 5d                	pop    %r13
  4010c2:	c3                   	retq   
  4010c3:	48 85 c0             	test   %rax,%rax
  4010c6:	74 d1                	je     401099 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0+0x49>
  4010c8:	eb 1b                	jmp    4010e5 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0+0x95>
  4010ca:	31 d2                	xor    %edx,%edx
  4010cc:	48 89 e6             	mov    %rsp,%rsi
  4010cf:	48 89 df             	mov    %rbx,%rdi
  4010d2:	e8 09 ff ff ff       	callq  400fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@plt>
  4010d7:	48 89 03             	mov    %rax,(%rbx)
  4010da:	49 89 c5             	mov    %rax,%r13
  4010dd:	48 8b 04 24          	mov    (%rsp),%rax
  4010e1:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4010e5:	4c 89 e2             	mov    %r12,%rdx
  4010e8:	48 89 ee             	mov    %rbp,%rsi
  4010eb:	4c 89 ef             	mov    %r13,%rdi
  4010ee:	e8 bd fd ff ff       	callq  400eb0 <memcpy@plt>
  4010f3:	eb a4                	jmp    401099 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0+0x49>
  4010f5:	e8 16 fe ff ff       	callq  400f10 <__stack_chk_fail@plt>
  4010fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401100 <main>:
  401100:	41 54                	push   %r12
  401102:	bf 08 00 00 00       	mov    $0x8,%edi
  401107:	55                   	push   %rbp
  401108:	48 83 ec 28          	sub    $0x28,%rsp
  40110c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401113:	00 00 
  401115:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  40111a:	31 c0                	xor    %eax,%eax
  40111c:	e8 2f fe ff ff       	callq  400f50 <malloc@plt>
  401121:	66 0f 6f 05 f7 0c 00 	movdqa 0xcf7(%rip),%xmm0        # 401e20 <_IO_stdin_used+0x100>
  401128:	00 
  401129:	ba 03 00 00 00       	mov    $0x3,%edx
  40112e:	48 89 e6             	mov    %rsp,%rsi
  401131:	bf 49 1d 40 00       	mov    $0x401d49,%edi
  401136:	48 89 c5             	mov    %rax,%rbp
  401139:	48 c7 44 24 10 00 02 	movq   $0x200,0x10(%rsp)
  401140:	00 00 
  401142:	0f 29 04 24          	movaps %xmm0,(%rsp)
  401146:	e8 b5 04 00 00       	callq  401600 <_Z11read_tensorPKcPli>
  40114b:	ba 03 00 00 00       	mov    $0x3,%edx
  401150:	48 89 e6             	mov    %rsp,%rsi
  401153:	bf 56 1d 40 00       	mov    $0x401d56,%edi
  401158:	49 89 c4             	mov    %rax,%r12
  40115b:	e8 a0 04 00 00       	callq  401600 <_Z11read_tensorPKcPli>
  401160:	b9 01 00 00 00       	mov    $0x1,%ecx
  401165:	48 89 e6             	mov    %rsp,%rsi
  401168:	4c 89 e7             	mov    %r12,%rdi
  40116b:	ba 03 00 00 00       	mov    $0x3,%edx
  401170:	e8 eb fc ff ff       	callq  400e60 <omTensorCreate@plt>
  401175:	be 01 00 00 00       	mov    $0x1,%esi
  40117a:	48 89 ef             	mov    %rbp,%rdi
  40117d:	48 89 45 00          	mov    %rax,0x0(%rbp)
  401181:	e8 ba fd ff ff       	callq  400f40 <omTensorListCreate@plt>
  401186:	48 89 c7             	mov    %rax,%rdi
  401189:	e8 02 fe ff ff       	callq  400f90 <run_main_graph@plt>
  40118e:	31 f6                	xor    %esi,%esi
  401190:	48 89 c7             	mov    %rax,%rdi
  401193:	e8 98 fd ff ff       	callq  400f30 <omTensorListGetOmtByIndex@plt>
  401198:	48 89 c7             	mov    %rax,%rdi
  40119b:	e8 a0 fc ff ff       	callq  400e40 <omTensorGetDataPtr@plt>
  4011a0:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  4011a5:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4011ac:	00 00 
  4011ae:	75 0a                	jne    4011ba <main+0xba>
  4011b0:	48 83 c4 28          	add    $0x28,%rsp
  4011b4:	31 c0                	xor    %eax,%eax
  4011b6:	5d                   	pop    %rbp
  4011b7:	41 5c                	pop    %r12
  4011b9:	c3                   	retq   
  4011ba:	e8 51 fd ff ff       	callq  400f10 <__stack_chk_fail@plt>
  4011bf:	90                   	nop

00000000004011c0 <_Z41__static_initialization_and_destruction_0ii.constprop.0>:
  4011c0:	41 54                	push   %r12
  4011c2:	bf 70 31 60 00       	mov    $0x603170,%edi
  4011c7:	55                   	push   %rbp
  4011c8:	53                   	push   %rbx
  4011c9:	48 81 ec 70 02 00 00 	sub    $0x270,%rsp
  4011d0:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4011d7:	00 00 
  4011d9:	48 89 84 24 68 02 00 	mov    %rax,0x268(%rsp)
  4011e0:	00 
  4011e1:	31 c0                	xor    %eax,%eax
  4011e3:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
  4011e8:	e8 93 fd ff ff       	callq  400f80 <_ZNSt8ios_base4InitC1Ev@plt>
  4011ed:	ba 18 31 60 00       	mov    $0x603118,%edx
  4011f2:	be 70 31 60 00       	mov    $0x603170,%esi
  4011f7:	bf 00 10 40 00       	mov    $0x401000,%edi
  4011fc:	e8 bf fc ff ff       	callq  400ec0 <__cxa_atexit@plt>
  401201:	be 64 1d 40 00       	mov    $0x401d64,%esi
  401206:	48 89 ef             	mov    %rbp,%rdi
  401209:	e8 42 fe ff ff       	callq  401050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
  40120e:	be 76 1d 40 00       	mov    $0x401d76,%esi
  401213:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
  401218:	c7 44 24 30 09 00 00 	movl   $0x9,0x30(%rsp)
  40121f:	00 
  401220:	e8 2b fe ff ff       	callq  401050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
  401225:	be 66 1d 40 00       	mov    $0x401d66,%esi
  40122a:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  40122f:	c7 44 24 58 03 00 00 	movl   $0x3,0x58(%rsp)
  401236:	00 
  401237:	e8 14 fe ff ff       	callq  401050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
  40123c:	be 68 1d 40 00       	mov    $0x401d68,%esi
  401241:	48 8d bc 24 88 00 00 	lea    0x88(%rsp),%rdi
  401248:	00 
  401249:	c7 84 24 80 00 00 00 	movl   $0x3,0x80(%rsp)
  401250:	03 00 00 00 
  401254:	e8 f7 fd ff ff       	callq  401050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
  401259:	be 6a 1d 40 00       	mov    $0x401d6a,%esi
  40125e:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  401265:	00 
  401266:	c7 84 24 a8 00 00 00 	movl   $0x2,0xa8(%rsp)
  40126d:	02 00 00 00 
  401271:	e8 da fd ff ff       	callq  401050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
  401276:	be 54 1d 40 00       	mov    $0x401d54,%esi
  40127b:	48 8d bc 24 d8 00 00 	lea    0xd8(%rsp),%rdi
  401282:	00 
  401283:	c7 84 24 d0 00 00 00 	movl   $0x5,0xd0(%rsp)
  40128a:	05 00 00 00 
  40128e:	e8 bd fd ff ff       	callq  401050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
  401293:	be 6c 1d 40 00       	mov    $0x401d6c,%esi
  401298:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  40129f:	00 
  4012a0:	c7 84 24 f8 00 00 00 	movl   $0x4,0xf8(%rsp)
  4012a7:	04 00 00 00 
  4012ab:	e8 a0 fd ff ff       	callq  401050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
  4012b0:	be 6e 1d 40 00       	mov    $0x401d6e,%esi
  4012b5:	48 8d bc 24 28 01 00 	lea    0x128(%rsp),%rdi
  4012bc:	00 
  4012bd:	c7 84 24 20 01 00 00 	movl   $0x6,0x120(%rsp)
  4012c4:	06 00 00 00 
  4012c8:	e8 83 fd ff ff       	callq  401050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
  4012cd:	be 70 1d 40 00       	mov    $0x401d70,%esi
  4012d2:	48 8d bc 24 50 01 00 	lea    0x150(%rsp),%rdi
  4012d9:	00 
  4012da:	c7 84 24 48 01 00 00 	movl   $0xc,0x148(%rsp)
  4012e1:	0c 00 00 00 
  4012e5:	e8 66 fd ff ff       	callq  401050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
  4012ea:	be 72 1d 40 00       	mov    $0x401d72,%esi
  4012ef:	48 8d bc 24 78 01 00 	lea    0x178(%rsp),%rdi
  4012f6:	00 
  4012f7:	c7 84 24 70 01 00 00 	movl   $0x7,0x170(%rsp)
  4012fe:	07 00 00 00 
  401302:	e8 49 fd ff ff       	callq  401050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
  401307:	be 79 1d 40 00       	mov    $0x401d79,%esi
  40130c:	48 8d bc 24 a0 01 00 	lea    0x1a0(%rsp),%rdi
  401313:	00 
  401314:	c7 84 24 98 01 00 00 	movl   $0xd,0x198(%rsp)
  40131b:	0d 00 00 00 
  40131f:	e8 2c fd ff ff       	callq  401050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
  401324:	be 7c 1d 40 00       	mov    $0x401d7c,%esi
  401329:	48 8d bc 24 c8 01 00 	lea    0x1c8(%rsp),%rdi
  401330:	00 
  401331:	c7 84 24 c0 01 00 00 	movl   $0x1,0x1c0(%rsp)
  401338:	01 00 00 00 
  40133c:	e8 0f fd ff ff       	callq  401050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
  401341:	be 74 1d 40 00       	mov    $0x401d74,%esi
  401346:	48 8d bc 24 f0 01 00 	lea    0x1f0(%rsp),%rdi
  40134d:	00 
  40134e:	c7 84 24 e8 01 00 00 	movl   $0xb,0x1e8(%rsp)
  401355:	0b 00 00 00 
  401359:	e8 f2 fc ff ff       	callq  401050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
  40135e:	be 78 1d 40 00       	mov    $0x401d78,%esi
  401363:	48 8d bc 24 18 02 00 	lea    0x218(%rsp),%rdi
  40136a:	00 
  40136b:	c7 84 24 10 02 00 00 	movl   $0x8,0x210(%rsp)
  401372:	08 00 00 00 
  401376:	e8 d5 fc ff ff       	callq  401050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
  40137b:	be 7b 1d 40 00       	mov    $0x401d7b,%esi
  401380:	48 8d bc 24 40 02 00 	lea    0x240(%rsp),%rdi
  401387:	00 
  401388:	c7 84 24 38 02 00 00 	movl   $0xe,0x238(%rsp)
  40138f:	0e 00 00 00 
  401393:	e8 b8 fc ff ff       	callq  401050 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.0>
  401398:	4c 8d 44 24 0e       	lea    0xe(%rsp),%r8
  40139d:	48 8d 4c 24 0f       	lea    0xf(%rsp),%rcx
  4013a2:	48 89 ee             	mov    %rbp,%rsi
  4013a5:	ba 0f 00 00 00       	mov    $0xf,%edx
  4013aa:	bf 40 31 60 00       	mov    $0x603140,%edi
  4013af:	c7 84 24 60 02 00 00 	movl   $0xf,0x260(%rsp)
  4013b6:	0f 00 00 00 
  4013ba:	e8 31 06 00 00       	callq  4019f0 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_>
  4013bf:	48 8d 9c 24 40 02 00 	lea    0x240(%rsp),%rbx
  4013c6:	00 
  4013c7:	eb 11                	jmp    4013da <_Z41__static_initialization_and_destruction_0ii.constprop.0+0x21a>
  4013c9:	e8 02 fb ff ff       	callq  400ed0 <_ZdlPv@plt>
  4013ce:	48 8d 43 d8          	lea    -0x28(%rbx),%rax
  4013d2:	48 39 dd             	cmp    %rbx,%rbp
  4013d5:	74 18                	je     4013ef <_Z41__static_initialization_and_destruction_0ii.constprop.0+0x22f>
  4013d7:	48 89 c3             	mov    %rax,%rbx
  4013da:	48 8b 3b             	mov    (%rbx),%rdi
  4013dd:	48 8d 43 10          	lea    0x10(%rbx),%rax
  4013e1:	48 39 c7             	cmp    %rax,%rdi
  4013e4:	75 e3                	jne    4013c9 <_Z41__static_initialization_and_destruction_0ii.constprop.0+0x209>
  4013e6:	48 8d 43 d8          	lea    -0x28(%rbx),%rax
  4013ea:	48 39 dd             	cmp    %rbx,%rbp
  4013ed:	75 e8                	jne    4013d7 <_Z41__static_initialization_and_destruction_0ii.constprop.0+0x217>
  4013ef:	ba 18 31 60 00       	mov    $0x603118,%edx
  4013f4:	be 40 31 60 00       	mov    $0x603140,%esi
  4013f9:	bf 20 18 40 00       	mov    $0x401820,%edi
  4013fe:	e8 bd fa ff ff       	callq  400ec0 <__cxa_atexit@plt>
  401403:	48 8b 84 24 68 02 00 	mov    0x268(%rsp),%rax
  40140a:	00 
  40140b:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401412:	00 00 
  401414:	75 0c                	jne    401422 <_Z41__static_initialization_and_destruction_0ii.constprop.0+0x262>
  401416:	48 81 c4 70 02 00 00 	add    $0x270,%rsp
  40141d:	5b                   	pop    %rbx
  40141e:	5d                   	pop    %rbp
  40141f:	41 5c                	pop    %r12
  401421:	c3                   	retq   
  401422:	e8 e9 fa ff ff       	callq  400f10 <__stack_chk_fail@plt>
  401427:	49 89 c4             	mov    %rax,%r12
  40142a:	e9 f1 fb ff ff       	jmpq   401020 <_Z41__static_initialization_and_destruction_0ii.constprop.0.cold>
  40142f:	90                   	nop

0000000000401430 <_GLOBAL__sub_I__Z12dummy_tensorPli>:
  401430:	e9 8b fd ff ff       	jmpq   4011c0 <_Z41__static_initialization_and_destruction_0ii.constprop.0>
  401435:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40143c:	00 00 00 
  40143f:	90                   	nop

0000000000401440 <_start>:
  401440:	31 ed                	xor    %ebp,%ebp
  401442:	49 89 d1             	mov    %rdx,%r9
  401445:	5e                   	pop    %rsi
  401446:	48 89 e2             	mov    %rsp,%rdx
  401449:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40144d:	50                   	push   %rax
  40144e:	54                   	push   %rsp
  40144f:	49 c7 c0 10 1d 40 00 	mov    $0x401d10,%r8
  401456:	48 c7 c1 a0 1c 40 00 	mov    $0x401ca0,%rcx
  40145d:	48 c7 c7 00 11 40 00 	mov    $0x401100,%rdi
  401464:	e8 87 fb ff ff       	callq  400ff0 <__libc_start_main@plt>
  401469:	f4                   	hlt    
  40146a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401470 <deregister_tm_clones>:
  401470:	b8 20 31 60 00       	mov    $0x603120,%eax
  401475:	48 3d 20 31 60 00    	cmp    $0x603120,%rax
  40147b:	74 13                	je     401490 <deregister_tm_clones+0x20>
  40147d:	b8 00 00 00 00       	mov    $0x0,%eax
  401482:	48 85 c0             	test   %rax,%rax
  401485:	74 09                	je     401490 <deregister_tm_clones+0x20>
  401487:	bf 20 31 60 00       	mov    $0x603120,%edi
  40148c:	ff e0                	jmpq   *%rax
  40148e:	66 90                	xchg   %ax,%ax
  401490:	c3                   	retq   
  401491:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401496:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40149d:	00 00 00 

00000000004014a0 <register_tm_clones>:
  4014a0:	be 20 31 60 00       	mov    $0x603120,%esi
  4014a5:	48 81 ee 20 31 60 00 	sub    $0x603120,%rsi
  4014ac:	48 89 f0             	mov    %rsi,%rax
  4014af:	48 c1 ee 3f          	shr    $0x3f,%rsi
  4014b3:	48 c1 f8 03          	sar    $0x3,%rax
  4014b7:	48 01 c6             	add    %rax,%rsi
  4014ba:	48 d1 fe             	sar    %rsi
  4014bd:	74 11                	je     4014d0 <register_tm_clones+0x30>
  4014bf:	b8 00 00 00 00       	mov    $0x0,%eax
  4014c4:	48 85 c0             	test   %rax,%rax
  4014c7:	74 07                	je     4014d0 <register_tm_clones+0x30>
  4014c9:	bf 20 31 60 00       	mov    $0x603120,%edi
  4014ce:	ff e0                	jmpq   *%rax
  4014d0:	c3                   	retq   
  4014d1:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4014d6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4014dd:	00 00 00 

00000000004014e0 <__do_global_dtors_aux>:
  4014e0:	80 3d 39 1c 20 00 00 	cmpb   $0x0,0x201c39(%rip)        # 603120 <__TMC_END__>
  4014e7:	75 17                	jne    401500 <__do_global_dtors_aux+0x20>
  4014e9:	55                   	push   %rbp
  4014ea:	48 89 e5             	mov    %rsp,%rbp
  4014ed:	e8 7e ff ff ff       	callq  401470 <deregister_tm_clones>
  4014f2:	c6 05 27 1c 20 00 01 	movb   $0x1,0x201c27(%rip)        # 603120 <__TMC_END__>
  4014f9:	5d                   	pop    %rbp
  4014fa:	c3                   	retq   
  4014fb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401500:	c3                   	retq   
  401501:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401506:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40150d:	00 00 00 

0000000000401510 <frame_dummy>:
  401510:	eb 8e                	jmp    4014a0 <register_tm_clones>
  401512:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  401519:	00 00 00 
  40151c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401520 <_Z12dummy_tensorPli>:
  401520:	53                   	push   %rbx
  401521:	85 f6                	test   %esi,%esi
  401523:	0f 8e b7 00 00 00    	jle    4015e0 <_Z12dummy_tensorPli+0xc0>
  401529:	8d 46 ff             	lea    -0x1(%rsi),%eax
  40152c:	bb 01 00 00 00       	mov    $0x1,%ebx
  401531:	48 8d 44 c7 08       	lea    0x8(%rdi,%rax,8),%rax
  401536:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40153d:	00 00 00 
  401540:	48 0f af 1f          	imul   (%rdi),%rbx
  401544:	48 83 c7 08          	add    $0x8,%rdi
  401548:	48 39 c7             	cmp    %rax,%rdi
  40154b:	75 f3                	jne    401540 <_Z12dummy_tensorPli+0x20>
  40154d:	48 8d 34 9d 00 00 00 	lea    0x0(,%rbx,4),%rsi
  401554:	00 
  401555:	bf 00 10 00 00       	mov    $0x1000,%edi
  40155a:	e8 41 f9 ff ff       	callq  400ea0 <aligned_alloc@plt>
  40155f:	48 85 db             	test   %rbx,%rbx
  401562:	74 70                	je     4015d4 <_Z12dummy_tensorPli+0xb4>
  401564:	48 8d 53 ff          	lea    -0x1(%rbx),%rdx
  401568:	48 83 fa 02          	cmp    $0x2,%rdx
  40156c:	0f 86 85 00 00 00    	jbe    4015f7 <_Z12dummy_tensorPli+0xd7>
  401572:	48 89 d9             	mov    %rbx,%rcx
  401575:	0f 28 05 84 08 00 00 	movaps 0x884(%rip),%xmm0        # 401e00 <_IO_stdin_used+0xe0>
  40157c:	48 89 c2             	mov    %rax,%rdx
  40157f:	48 c1 e9 02          	shr    $0x2,%rcx
  401583:	48 c1 e1 04          	shl    $0x4,%rcx
  401587:	48 01 c1             	add    %rax,%rcx
  40158a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  401590:	0f 29 02             	movaps %xmm0,(%rdx)
  401593:	48 83 c2 10          	add    $0x10,%rdx
  401597:	48 39 ca             	cmp    %rcx,%rdx
  40159a:	75 f4                	jne    401590 <_Z12dummy_tensorPli+0x70>
  40159c:	48 89 d9             	mov    %rbx,%rcx
  40159f:	48 83 e1 fc          	and    $0xfffffffffffffffc,%rcx
  4015a3:	48 89 ca             	mov    %rcx,%rdx
  4015a6:	48 39 cb             	cmp    %rcx,%rbx
  4015a9:	74 29                	je     4015d4 <_Z12dummy_tensorPli+0xb4>
  4015ab:	f3 0f 10 05 45 08 00 	movss  0x845(%rip),%xmm0        # 401df8 <_IO_stdin_used+0xd8>
  4015b2:	00 
  4015b3:	f3 0f 11 04 88       	movss  %xmm0,(%rax,%rcx,4)
  4015b8:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  4015bc:	48 39 cb             	cmp    %rcx,%rbx
  4015bf:	76 13                	jbe    4015d4 <_Z12dummy_tensorPli+0xb4>
  4015c1:	48 83 c2 02          	add    $0x2,%rdx
  4015c5:	f3 0f 11 04 88       	movss  %xmm0,(%rax,%rcx,4)
  4015ca:	48 39 d3             	cmp    %rdx,%rbx
  4015cd:	76 05                	jbe    4015d4 <_Z12dummy_tensorPli+0xb4>
  4015cf:	f3 0f 11 04 90       	movss  %xmm0,(%rax,%rdx,4)
  4015d4:	5b                   	pop    %rbx
  4015d5:	c3                   	retq   
  4015d6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4015dd:	00 00 00 
  4015e0:	be 04 00 00 00       	mov    $0x4,%esi
  4015e5:	bf 00 10 00 00       	mov    $0x1000,%edi
  4015ea:	e8 b1 f8 ff ff       	callq  400ea0 <aligned_alloc@plt>
  4015ef:	c7 00 00 00 80 3f    	movl   $0x3f800000,(%rax)
  4015f5:	5b                   	pop    %rbx
  4015f6:	c3                   	retq   
  4015f7:	31 d2                	xor    %edx,%edx
  4015f9:	31 c9                	xor    %ecx,%ecx
  4015fb:	eb ae                	jmp    4015ab <_Z12dummy_tensorPli+0x8b>
  4015fd:	0f 1f 00             	nopl   (%rax)

0000000000401600 <_Z11read_tensorPKcPli>:
  401600:	41 55                	push   %r13
  401602:	41 54                	push   %r12
  401604:	49 89 fc             	mov    %rdi,%r12
  401607:	55                   	push   %rbp
  401608:	53                   	push   %rbx
  401609:	48 83 ec 08          	sub    $0x8,%rsp
  40160d:	85 d2                	test   %edx,%edx
  40160f:	0f 8e 9b 00 00 00    	jle    4016b0 <_Z11read_tensorPKcPli+0xb0>
  401615:	8d 42 ff             	lea    -0x1(%rdx),%eax
  401618:	bb 01 00 00 00       	mov    $0x1,%ebx
  40161d:	48 8d 44 c6 08       	lea    0x8(%rsi,%rax,8),%rax
  401622:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  401628:	48 0f af 1e          	imul   (%rsi),%rbx
  40162c:	48 83 c6 08          	add    $0x8,%rsi
  401630:	48 39 f0             	cmp    %rsi,%rax
  401633:	75 f3                	jne    401628 <_Z11read_tensorPKcPli+0x28>
  401635:	48 8d 34 9d 00 00 00 	lea    0x0(,%rbx,4),%rsi
  40163c:	00 
  40163d:	bf 00 10 00 00       	mov    $0x1000,%edi
  401642:	e8 59 f8 ff ff       	callq  400ea0 <aligned_alloc@plt>
  401647:	be 24 1d 40 00       	mov    $0x401d24,%esi
  40164c:	4c 89 e7             	mov    %r12,%rdi
  40164f:	49 89 c5             	mov    %rax,%r13
  401652:	e8 c9 f8 ff ff       	callq  400f20 <fopen@plt>
  401657:	48 89 da             	mov    %rbx,%rdx
  40165a:	be 04 00 00 00       	mov    $0x4,%esi
  40165f:	4c 89 ef             	mov    %r13,%rdi
  401662:	48 89 c1             	mov    %rax,%rcx
  401665:	48 89 c5             	mov    %rax,%rbp
  401668:	e8 03 f9 ff ff       	callq  400f70 <fread@plt>
  40166d:	48 39 c3             	cmp    %rax,%rbx
  401670:	77 1e                	ja     401690 <_Z11read_tensorPKcPli+0x90>
  401672:	48 89 ef             	mov    %rbp,%rdi
  401675:	e8 66 f8 ff ff       	callq  400ee0 <fclose@plt>
  40167a:	48 83 c4 08          	add    $0x8,%rsp
  40167e:	4c 89 e8             	mov    %r13,%rax
  401681:	5b                   	pop    %rbx
  401682:	5d                   	pop    %rbp
  401683:	41 5c                	pop    %r12
  401685:	41 5d                	pop    %r13
  401687:	c3                   	retq   
  401688:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40168f:	00 
  401690:	4c 89 e2             	mov    %r12,%rdx
  401693:	be 80 1d 40 00       	mov    $0x401d80,%esi
  401698:	bf 01 00 00 00       	mov    $0x1,%edi
  40169d:	31 c0                	xor    %eax,%eax
  40169f:	e8 7c f7 ff ff       	callq  400e20 <__printf_chk@plt>
  4016a4:	eb cc                	jmp    401672 <_Z11read_tensorPKcPli+0x72>
  4016a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4016ad:	00 00 00 
  4016b0:	be 04 00 00 00       	mov    $0x4,%esi
  4016b5:	bb 01 00 00 00       	mov    $0x1,%ebx
  4016ba:	eb 81                	jmp    40163d <_Z11read_tensorPKcPli+0x3d>
  4016bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004016c0 <_Z12check_outputPfS_Pli>:
  4016c0:	41 55                	push   %r13
  4016c2:	49 89 f5             	mov    %rsi,%r13
  4016c5:	41 54                	push   %r12
  4016c7:	49 89 fc             	mov    %rdi,%r12
  4016ca:	55                   	push   %rbp
  4016cb:	53                   	push   %rbx
  4016cc:	48 83 ec 08          	sub    $0x8,%rsp
  4016d0:	85 c9                	test   %ecx,%ecx
  4016d2:	0f 8e c0 00 00 00    	jle    401798 <_Z12check_outputPfS_Pli+0xd8>
  4016d8:	8d 41 ff             	lea    -0x1(%rcx),%eax
  4016db:	bd 01 00 00 00       	mov    $0x1,%ebp
  4016e0:	48 8d 44 c2 08       	lea    0x8(%rdx,%rax,8),%rax
  4016e5:	0f 1f 00             	nopl   (%rax)
  4016e8:	48 0f af 2a          	imul   (%rdx),%rbp
  4016ec:	48 83 c2 08          	add    $0x8,%rdx
  4016f0:	48 39 d0             	cmp    %rdx,%rax
  4016f3:	75 f3                	jne    4016e8 <_Z12check_outputPfS_Pli+0x28>
  4016f5:	bf 26 1d 40 00       	mov    $0x401d26,%edi
  4016fa:	e8 a1 f8 ff ff       	callq  400fa0 <puts@plt>
  4016ff:	48 85 ed             	test   %rbp,%rbp
  401702:	74 7c                	je     401780 <_Z12check_outputPfS_Pli+0xc0>
  401704:	f2 0f 10 1d 24 07 00 	movsd  0x724(%rip),%xmm3        # 401e30 <_IO_stdin_used+0x110>
  40170b:	00 
  40170c:	31 db                	xor    %ebx,%ebx
  40170e:	66 0f ef e4          	pxor   %xmm4,%xmm4
  401712:	eb 0d                	jmp    401721 <_Z12check_outputPfS_Pli+0x61>
  401714:	0f 1f 40 00          	nopl   0x0(%rax)
  401718:	48 83 c3 01          	add    $0x1,%rbx
  40171c:	48 39 dd             	cmp    %rbx,%rbp
  40171f:	76 5f                	jbe    401780 <_Z12check_outputPfS_Pli+0xc0>
  401721:	f3 41 0f 10 04 9c    	movss  (%r12,%rbx,4),%xmm0
  401727:	f3 41 0f 10 4c 9d 00 	movss  0x0(%r13,%rbx,4),%xmm1
  40172e:	0f 28 d0             	movaps %xmm0,%xmm2
  401731:	f3 0f 5c d1          	subss  %xmm1,%xmm2
  401735:	0f 2f e2             	comiss %xmm2,%xmm4
  401738:	76 07                	jbe    401741 <_Z12check_outputPfS_Pli+0x81>
  40173a:	0f 57 15 cf 06 00 00 	xorps  0x6cf(%rip),%xmm2        # 401e10 <_IO_stdin_used+0xf0>
  401741:	f3 0f 5a d2          	cvtss2sd %xmm2,%xmm2
  401745:	66 0f 2f d3          	comisd %xmm3,%xmm2
  401749:	72 cd                	jb     401718 <_Z12check_outputPfS_Pli+0x58>
  40174b:	be a8 1d 40 00       	mov    $0x401da8,%esi
  401750:	f3 0f 5a c0          	cvtss2sd %xmm0,%xmm0
  401754:	f3 0f 5a c9          	cvtss2sd %xmm1,%xmm1
  401758:	48 83 c3 01          	add    $0x1,%rbx
  40175c:	bf 01 00 00 00       	mov    $0x1,%edi
  401761:	b8 03 00 00 00       	mov    $0x3,%eax
  401766:	e8 b5 f6 ff ff       	callq  400e20 <__printf_chk@plt>
  40176b:	48 8b 05 be 06 00 00 	mov    0x6be(%rip),%rax        # 401e30 <_IO_stdin_used+0x110>
  401772:	66 0f ef e4          	pxor   %xmm4,%xmm4
  401776:	66 48 0f 6e d8       	movq   %rax,%xmm3
  40177b:	48 39 dd             	cmp    %rbx,%rbp
  40177e:	77 a1                	ja     401721 <_Z12check_outputPfS_Pli+0x61>
  401780:	48 83 c4 08          	add    $0x8,%rsp
  401784:	bf 3a 1d 40 00       	mov    $0x401d3a,%edi
  401789:	5b                   	pop    %rbx
  40178a:	5d                   	pop    %rbp
  40178b:	41 5c                	pop    %r12
  40178d:	41 5d                	pop    %r13
  40178f:	e9 0c f8 ff ff       	jmpq   400fa0 <puts@plt>
  401794:	0f 1f 40 00          	nopl   0x0(%rax)
  401798:	bf 26 1d 40 00       	mov    $0x401d26,%edi
  40179d:	bd 01 00 00 00       	mov    $0x1,%ebp
  4017a2:	e8 f9 f7 ff ff       	callq  400fa0 <puts@plt>
  4017a7:	e9 58 ff ff ff       	jmpq   401704 <_Z12check_outputPfS_Pli+0x44>
  4017ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004017b0 <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE8_M_eraseEPSt13_Rb_tree_nodeIS9_E>:
  4017b0:	48 85 f6             	test   %rsi,%rsi
  4017b3:	74 5b                	je     401810 <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE8_M_eraseEPSt13_Rb_tree_nodeIS9_E+0x60>
  4017b5:	41 54                	push   %r12
  4017b7:	49 89 fc             	mov    %rdi,%r12
  4017ba:	55                   	push   %rbp
  4017bb:	48 89 f5             	mov    %rsi,%rbp
  4017be:	53                   	push   %rbx
  4017bf:	48 8b 75 18          	mov    0x18(%rbp),%rsi
  4017c3:	4c 89 e7             	mov    %r12,%rdi
  4017c6:	e8 e5 ff ff ff       	callq  4017b0 <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE8_M_eraseEPSt13_Rb_tree_nodeIS9_E>
  4017cb:	48 8b 7d 20          	mov    0x20(%rbp),%rdi
  4017cf:	48 8d 45 30          	lea    0x30(%rbp),%rax
  4017d3:	48 8b 5d 10          	mov    0x10(%rbp),%rbx
  4017d7:	48 39 c7             	cmp    %rax,%rdi
  4017da:	74 1c                	je     4017f8 <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE8_M_eraseEPSt13_Rb_tree_nodeIS9_E+0x48>
  4017dc:	e8 ef f6 ff ff       	callq  400ed0 <_ZdlPv@plt>
  4017e1:	48 89 ef             	mov    %rbp,%rdi
  4017e4:	e8 e7 f6 ff ff       	callq  400ed0 <_ZdlPv@plt>
  4017e9:	48 85 db             	test   %rbx,%rbx
  4017ec:	74 17                	je     401805 <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE8_M_eraseEPSt13_Rb_tree_nodeIS9_E+0x55>
  4017ee:	48 89 dd             	mov    %rbx,%rbp
  4017f1:	eb cc                	jmp    4017bf <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE8_M_eraseEPSt13_Rb_tree_nodeIS9_E+0xf>
  4017f3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4017f8:	48 89 ef             	mov    %rbp,%rdi
  4017fb:	e8 d0 f6 ff ff       	callq  400ed0 <_ZdlPv@plt>
  401800:	48 85 db             	test   %rbx,%rbx
  401803:	75 e9                	jne    4017ee <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE8_M_eraseEPSt13_Rb_tree_nodeIS9_E+0x3e>
  401805:	5b                   	pop    %rbx
  401806:	5d                   	pop    %rbp
  401807:	41 5c                	pop    %r12
  401809:	c3                   	retq   
  40180a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  401810:	c3                   	retq   
  401811:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  401818:	00 00 00 
  40181b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401820 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEED1Ev>:
  401820:	41 54                	push   %r12
  401822:	55                   	push   %rbp
  401823:	53                   	push   %rbx
  401824:	48 8b 6f 10          	mov    0x10(%rdi),%rbp
  401828:	48 85 ed             	test   %rbp,%rbp
  40182b:	74 48                	je     401875 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEED1Ev+0x55>
  40182d:	48 89 fb             	mov    %rdi,%rbx
  401830:	48 8b 75 18          	mov    0x18(%rbp),%rsi
  401834:	48 89 df             	mov    %rbx,%rdi
  401837:	e8 74 ff ff ff       	callq  4017b0 <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE8_M_eraseEPSt13_Rb_tree_nodeIS9_E>
  40183c:	48 8b 7d 20          	mov    0x20(%rbp),%rdi
  401840:	48 8d 45 30          	lea    0x30(%rbp),%rax
  401844:	4c 8b 65 10          	mov    0x10(%rbp),%r12
  401848:	48 39 c7             	cmp    %rax,%rdi
  40184b:	74 1b                	je     401868 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEED1Ev+0x48>
  40184d:	e8 7e f6 ff ff       	callq  400ed0 <_ZdlPv@plt>
  401852:	48 89 ef             	mov    %rbp,%rdi
  401855:	e8 76 f6 ff ff       	callq  400ed0 <_ZdlPv@plt>
  40185a:	4d 85 e4             	test   %r12,%r12
  40185d:	74 16                	je     401875 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEED1Ev+0x55>
  40185f:	4c 89 e5             	mov    %r12,%rbp
  401862:	eb cc                	jmp    401830 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEED1Ev+0x10>
  401864:	0f 1f 40 00          	nopl   0x0(%rax)
  401868:	48 89 ef             	mov    %rbp,%rdi
  40186b:	e8 60 f6 ff ff       	callq  400ed0 <_ZdlPv@plt>
  401870:	4d 85 e4             	test   %r12,%r12
  401873:	75 ea                	jne    40185f <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEED1Ev+0x3f>
  401875:	5b                   	pop    %rbx
  401876:	5d                   	pop    %rbp
  401877:	41 5c                	pop    %r12
  401879:	c3                   	retq   
  40187a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401880 <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE24_M_get_insert_unique_posERS7_>:
  401880:	41 57                	push   %r15
  401882:	41 56                	push   %r14
  401884:	41 55                	push   %r13
  401886:	41 54                	push   %r12
  401888:	55                   	push   %rbp
  401889:	53                   	push   %rbx
  40188a:	48 83 ec 18          	sub    $0x18,%rsp
  40188e:	4c 8b 77 10          	mov    0x10(%rdi),%r14
  401892:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
  401897:	48 89 34 24          	mov    %rsi,(%rsp)
  40189b:	4d 85 f6             	test   %r14,%r14
  40189e:	0f 84 e4 00 00 00    	je     401988 <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE24_M_get_insert_unique_posERS7_+0x108>
  4018a4:	4c 8b 6e 08          	mov    0x8(%rsi),%r13
  4018a8:	4c 8b 26             	mov    (%rsi),%r12
  4018ab:	eb 14                	jmp    4018c1 <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE24_M_get_insert_unique_posERS7_+0x41>
  4018ad:	0f 1f 00             	nopl   (%rax)
  4018b0:	49 8b 46 10          	mov    0x10(%r14),%rax
  4018b4:	be 01 00 00 00       	mov    $0x1,%esi
  4018b9:	48 85 c0             	test   %rax,%rax
  4018bc:	74 5a                	je     401918 <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE24_M_get_insert_unique_posERS7_+0x98>
  4018be:	49 89 c6             	mov    %rax,%r14
  4018c1:	4d 8b 7e 28          	mov    0x28(%r14),%r15
  4018c5:	49 8b 6e 20          	mov    0x20(%r14),%rbp
  4018c9:	4d 39 fd             	cmp    %r15,%r13
  4018cc:	4c 89 fb             	mov    %r15,%rbx
  4018cf:	49 0f 46 dd          	cmovbe %r13,%rbx
  4018d3:	48 85 db             	test   %rbx,%rbx
  4018d6:	74 12                	je     4018ea <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE24_M_get_insert_unique_posERS7_+0x6a>
  4018d8:	48 89 da             	mov    %rbx,%rdx
  4018db:	48 89 ee             	mov    %rbp,%rsi
  4018de:	4c 89 e7             	mov    %r12,%rdi
  4018e1:	e8 9a f5 ff ff       	callq  400e80 <memcmp@plt>
  4018e6:	85 c0                	test   %eax,%eax
  4018e8:	75 1f                	jne    401909 <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE24_M_get_insert_unique_posERS7_+0x89>
  4018ea:	4c 89 e8             	mov    %r13,%rax
  4018ed:	b9 00 00 00 80       	mov    $0x80000000,%ecx
  4018f2:	4c 29 f8             	sub    %r15,%rax
  4018f5:	48 39 c8             	cmp    %rcx,%rax
  4018f8:	7d 13                	jge    40190d <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE24_M_get_insert_unique_posERS7_+0x8d>
  4018fa:	48 ba ff ff ff 7f ff 	movabs $0xffffffff7fffffff,%rdx
  401901:	ff ff ff 
  401904:	48 39 d0             	cmp    %rdx,%rax
  401907:	7e a7                	jle    4018b0 <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE24_M_get_insert_unique_posERS7_+0x30>
  401909:	85 c0                	test   %eax,%eax
  40190b:	78 a3                	js     4018b0 <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE24_M_get_insert_unique_posERS7_+0x30>
  40190d:	49 8b 46 18          	mov    0x18(%r14),%rax
  401911:	31 f6                	xor    %esi,%esi
  401913:	48 85 c0             	test   %rax,%rax
  401916:	75 a6                	jne    4018be <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE24_M_get_insert_unique_posERS7_+0x3e>
  401918:	4c 89 f1             	mov    %r14,%rcx
  40191b:	40 84 f6             	test   %sil,%sil
  40191e:	75 6c                	jne    40198c <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE24_M_get_insert_unique_posERS7_+0x10c>
  401920:	48 85 db             	test   %rbx,%rbx
  401923:	74 1a                	je     40193f <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE24_M_get_insert_unique_posERS7_+0xbf>
  401925:	48 89 da             	mov    %rbx,%rdx
  401928:	4c 89 e6             	mov    %r12,%rsi
  40192b:	48 89 ef             	mov    %rbp,%rdi
  40192e:	48 89 0c 24          	mov    %rcx,(%rsp)
  401932:	e8 49 f5 ff ff       	callq  400e80 <memcmp@plt>
  401937:	48 8b 0c 24          	mov    (%rsp),%rcx
  40193b:	85 c0                	test   %eax,%eax
  40193d:	75 18                	jne    401957 <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE24_M_get_insert_unique_posERS7_+0xd7>
  40193f:	4d 29 ef             	sub    %r13,%r15
  401942:	49 81 ff ff ff ff 7f 	cmp    $0x7fffffff,%r15
  401949:	7f 10                	jg     40195b <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE24_M_get_insert_unique_posERS7_+0xdb>
  40194b:	49 81 ff 00 00 00 80 	cmp    $0xffffffff80000000,%r15
  401952:	7c 1c                	jl     401970 <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE24_M_get_insert_unique_posERS7_+0xf0>
  401954:	44 89 f8             	mov    %r15d,%eax
  401957:	85 c0                	test   %eax,%eax
  401959:	78 15                	js     401970 <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE24_M_get_insert_unique_posERS7_+0xf0>
  40195b:	48 83 c4 18          	add    $0x18,%rsp
  40195f:	4c 89 f0             	mov    %r14,%rax
  401962:	31 d2                	xor    %edx,%edx
  401964:	5b                   	pop    %rbx
  401965:	5d                   	pop    %rbp
  401966:	41 5c                	pop    %r12
  401968:	41 5d                	pop    %r13
  40196a:	41 5e                	pop    %r14
  40196c:	41 5f                	pop    %r15
  40196e:	c3                   	retq   
  40196f:	90                   	nop
  401970:	48 83 c4 18          	add    $0x18,%rsp
  401974:	31 c0                	xor    %eax,%eax
  401976:	48 89 ca             	mov    %rcx,%rdx
  401979:	5b                   	pop    %rbx
  40197a:	5d                   	pop    %rbp
  40197b:	41 5c                	pop    %r12
  40197d:	41 5d                	pop    %r13
  40197f:	41 5e                	pop    %r14
  401981:	41 5f                	pop    %r15
  401983:	c3                   	retq   
  401984:	0f 1f 40 00          	nopl   0x0(%rax)
  401988:	4c 8d 77 08          	lea    0x8(%rdi),%r14
  40198c:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  401991:	4c 3b 70 18          	cmp    0x18(%rax),%r14
  401995:	74 39                	je     4019d0 <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE24_M_get_insert_unique_posERS7_+0x150>
  401997:	4c 89 f7             	mov    %r14,%rdi
  40199a:	e8 61 f5 ff ff       	callq  400f00 <_ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base@plt>
  40199f:	48 8b 0c 24          	mov    (%rsp),%rcx
  4019a3:	4c 8b 78 28          	mov    0x28(%rax),%r15
  4019a7:	48 8b 68 20          	mov    0x20(%rax),%rbp
  4019ab:	4c 8b 69 08          	mov    0x8(%rcx),%r13
  4019af:	4c 8b 21             	mov    (%rcx),%r12
  4019b2:	4c 89 f1             	mov    %r14,%rcx
  4019b5:	49 89 c6             	mov    %rax,%r14
  4019b8:	4d 39 ef             	cmp    %r13,%r15
  4019bb:	4c 89 eb             	mov    %r13,%rbx
  4019be:	49 0f 46 df          	cmovbe %r15,%rbx
  4019c2:	e9 59 ff ff ff       	jmpq   401920 <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE24_M_get_insert_unique_posERS7_+0xa0>
  4019c7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  4019ce:	00 00 
  4019d0:	48 83 c4 18          	add    $0x18,%rsp
  4019d4:	4c 89 f2             	mov    %r14,%rdx
  4019d7:	31 c0                	xor    %eax,%eax
  4019d9:	5b                   	pop    %rbx
  4019da:	5d                   	pop    %rbp
  4019db:	41 5c                	pop    %r12
  4019dd:	41 5d                	pop    %r13
  4019df:	41 5e                	pop    %r14
  4019e1:	41 5f                	pop    %r15
  4019e3:	c3                   	retq   
  4019e4:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4019eb:	00 00 00 
  4019ee:	66 90                	xchg   %ax,%ax

00000000004019f0 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_>:
  4019f0:	41 57                	push   %r15
  4019f2:	41 56                	push   %r14
  4019f4:	41 55                	push   %r13
  4019f6:	41 54                	push   %r12
  4019f8:	55                   	push   %rbp
  4019f9:	53                   	push   %rbx
  4019fa:	48 83 ec 38          	sub    $0x38,%rsp
  4019fe:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401a05:	00 00 
  401a07:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  401a0c:	31 c0                	xor    %eax,%eax
  401a0e:	48 8d 47 08          	lea    0x8(%rdi),%rax
  401a12:	c7 47 08 00 00 00 00 	movl   $0x0,0x8(%rdi)
  401a19:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  401a1e:	48 89 47 18          	mov    %rax,0x18(%rdi)
  401a22:	48 89 47 20          	mov    %rax,0x20(%rdi)
  401a26:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  401a2a:	48 8d 04 c6          	lea    (%rsi,%rax,8),%rax
  401a2e:	48 c7 47 10 00 00 00 	movq   $0x0,0x10(%rdi)
  401a35:	00 
  401a36:	48 c7 47 28 00 00 00 	movq   $0x0,0x28(%rdi)
  401a3d:	00 
  401a3e:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  401a43:	48 39 f0             	cmp    %rsi,%rax
  401a46:	0f 84 84 01 00 00    	je     401bd0 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0x1e0>
  401a4c:	49 89 fd             	mov    %rdi,%r13
  401a4f:	48 89 f3             	mov    %rsi,%rbx
  401a52:	31 c0                	xor    %eax,%eax
  401a54:	0f 1f 40 00          	nopl   0x0(%rax)
  401a58:	48 85 c0             	test   %rax,%rax
  401a5b:	74 5b                	je     401ab8 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0xc8>
  401a5d:	4d 8b 65 20          	mov    0x20(%r13),%r12
  401a61:	4c 8b 73 08          	mov    0x8(%rbx),%r14
  401a65:	49 8b 6c 24 28       	mov    0x28(%r12),%rbp
  401a6a:	4c 89 f2             	mov    %r14,%rdx
  401a6d:	4c 39 f5             	cmp    %r14,%rbp
  401a70:	48 0f 46 d5          	cmovbe %rbp,%rdx
  401a74:	48 85 d2             	test   %rdx,%rdx
  401a77:	74 11                	je     401a8a <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0x9a>
  401a79:	49 8b 7c 24 20       	mov    0x20(%r12),%rdi
  401a7e:	48 8b 33             	mov    (%rbx),%rsi
  401a81:	e8 fa f3 ff ff       	callq  400e80 <memcmp@plt>
  401a86:	85 c0                	test   %eax,%eax
  401a88:	75 22                	jne    401aac <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0xbc>
  401a8a:	4c 29 f5             	sub    %r14,%rbp
  401a8d:	b8 00 00 00 80       	mov    $0x80000000,%eax
  401a92:	48 39 c5             	cmp    %rax,%rbp
  401a95:	7d 21                	jge    401ab8 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0xc8>
  401a97:	48 b8 ff ff ff 7f ff 	movabs $0xffffffff7fffffff,%rax
  401a9e:	ff ff ff 
  401aa1:	48 39 c5             	cmp    %rax,%rbp
  401aa4:	0f 8e c6 00 00 00    	jle    401b70 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0x180>
  401aaa:	89 e8                	mov    %ebp,%eax
  401aac:	85 c0                	test   %eax,%eax
  401aae:	0f 88 bc 00 00 00    	js     401b70 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0x180>
  401ab4:	0f 1f 40 00          	nopl   0x0(%rax)
  401ab8:	48 89 de             	mov    %rbx,%rsi
  401abb:	4c 89 ef             	mov    %r13,%rdi
  401abe:	e8 bd fd ff ff       	callq  401880 <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE24_M_get_insert_unique_posERS7_>
  401ac3:	49 89 d4             	mov    %rdx,%r12
  401ac6:	48 85 d2             	test   %rdx,%rdx
  401ac9:	0f 84 8a 00 00 00    	je     401b59 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0x169>
  401acf:	48 85 c0             	test   %rax,%rax
  401ad2:	40 0f 95 c7          	setne  %dil
  401ad6:	4c 39 64 24 08       	cmp    %r12,0x8(%rsp)
  401adb:	0f 94 c0             	sete   %al
  401ade:	40 08 f8             	or     %dil,%al
  401ae1:	88 44 24 14          	mov    %al,0x14(%rsp)
  401ae5:	0f 84 05 01 00 00    	je     401bf0 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0x200>
  401aeb:	bf 48 00 00 00       	mov    $0x48,%edi
  401af0:	e8 fb f3 ff ff       	callq  400ef0 <_Znwm@plt>
  401af5:	4c 8b 3b             	mov    (%rbx),%r15
  401af8:	48 8d 78 30          	lea    0x30(%rax),%rdi
  401afc:	4c 8b 73 08          	mov    0x8(%rbx),%r14
  401b00:	48 89 c5             	mov    %rax,%rbp
  401b03:	48 89 78 20          	mov    %rdi,0x20(%rax)
  401b07:	4c 89 f8             	mov    %r15,%rax
  401b0a:	4c 01 f0             	add    %r14,%rax
  401b0d:	74 09                	je     401b18 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0x128>
  401b0f:	4d 85 ff             	test   %r15,%r15
  401b12:	0f 84 39 01 00 00    	je     401c51 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0x261>
  401b18:	4c 89 74 24 20       	mov    %r14,0x20(%rsp)
  401b1d:	49 83 fe 0f          	cmp    $0xf,%r14
  401b21:	77 6d                	ja     401b90 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0x1a0>
  401b23:	49 83 fe 01          	cmp    $0x1,%r14
  401b27:	75 57                	jne    401b80 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0x190>
  401b29:	41 0f b6 07          	movzbl (%r15),%eax
  401b2d:	88 45 30             	mov    %al,0x30(%rbp)
  401b30:	4c 89 75 28          	mov    %r14,0x28(%rbp)
  401b34:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  401b39:	4c 89 e2             	mov    %r12,%rdx
  401b3c:	48 89 ee             	mov    %rbp,%rsi
  401b3f:	42 c6 04 37 00       	movb   $0x0,(%rdi,%r14,1)
  401b44:	8b 43 20             	mov    0x20(%rbx),%eax
  401b47:	0f b6 7c 24 14       	movzbl 0x14(%rsp),%edi
  401b4c:	89 45 40             	mov    %eax,0x40(%rbp)
  401b4f:	e8 dc f2 ff ff       	callq  400e30 <_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_@plt>
  401b54:	49 83 45 28 01       	addq   $0x1,0x28(%r13)
  401b59:	48 83 c3 28          	add    $0x28,%rbx
  401b5d:	48 3b 5c 24 18       	cmp    0x18(%rsp),%rbx
  401b62:	74 6c                	je     401bd0 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0x1e0>
  401b64:	49 8b 45 28          	mov    0x28(%r13),%rax
  401b68:	e9 eb fe ff ff       	jmpq   401a58 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0x68>
  401b6d:	0f 1f 00             	nopl   (%rax)
  401b70:	31 ff                	xor    %edi,%edi
  401b72:	e9 5f ff ff ff       	jmpq   401ad6 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0xe6>
  401b77:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  401b7e:	00 00 
  401b80:	4d 85 f6             	test   %r14,%r14
  401b83:	74 ab                	je     401b30 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0x140>
  401b85:	eb 29                	jmp    401bb0 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0x1c0>
  401b87:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  401b8e:	00 00 
  401b90:	48 8d 7d 20          	lea    0x20(%rbp),%rdi
  401b94:	31 d2                	xor    %edx,%edx
  401b96:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
  401b9b:	e8 40 f4 ff ff       	callq  400fe0 <_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@plt>
  401ba0:	48 89 45 20          	mov    %rax,0x20(%rbp)
  401ba4:	48 89 c7             	mov    %rax,%rdi
  401ba7:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
  401bac:	48 89 45 30          	mov    %rax,0x30(%rbp)
  401bb0:	4c 89 f2             	mov    %r14,%rdx
  401bb3:	4c 89 fe             	mov    %r15,%rsi
  401bb6:	e8 f5 f2 ff ff       	callq  400eb0 <memcpy@plt>
  401bbb:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
  401bc0:	48 8b 7d 20          	mov    0x20(%rbp),%rdi
  401bc4:	e9 67 ff ff ff       	jmpq   401b30 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0x140>
  401bc9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  401bd0:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  401bd5:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401bdc:	00 00 
  401bde:	75 7b                	jne    401c5b <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0x26b>
  401be0:	48 83 c4 38          	add    $0x38,%rsp
  401be4:	5b                   	pop    %rbx
  401be5:	5d                   	pop    %rbp
  401be6:	41 5c                	pop    %r12
  401be8:	41 5d                	pop    %r13
  401bea:	41 5e                	pop    %r14
  401bec:	41 5f                	pop    %r15
  401bee:	c3                   	retq   
  401bef:	90                   	nop
  401bf0:	48 8b 6b 08          	mov    0x8(%rbx),%rbp
  401bf4:	4d 8b 74 24 28       	mov    0x28(%r12),%r14
  401bf9:	4c 39 f5             	cmp    %r14,%rbp
  401bfc:	4c 89 f2             	mov    %r14,%rdx
  401bff:	48 0f 46 d5          	cmovbe %rbp,%rdx
  401c03:	48 85 d2             	test   %rdx,%rdx
  401c06:	74 11                	je     401c19 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0x229>
  401c08:	49 8b 74 24 20       	mov    0x20(%r12),%rsi
  401c0d:	48 8b 3b             	mov    (%rbx),%rdi
  401c10:	e8 6b f2 ff ff       	callq  400e80 <memcmp@plt>
  401c15:	85 c0                	test   %eax,%eax
  401c17:	75 22                	jne    401c3b <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0x24b>
  401c19:	4c 29 f5             	sub    %r14,%rbp
  401c1c:	b8 00 00 00 80       	mov    $0x80000000,%eax
  401c21:	48 39 c5             	cmp    %rax,%rbp
  401c24:	0f 8d c1 fe ff ff    	jge    401aeb <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0xfb>
  401c2a:	48 b8 ff ff ff 7f ff 	movabs $0xffffffff7fffffff,%rax
  401c31:	ff ff ff 
  401c34:	48 39 c5             	cmp    %rax,%rbp
  401c37:	7e 0e                	jle    401c47 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0x257>
  401c39:	89 e8                	mov    %ebp,%eax
  401c3b:	c1 e8 1f             	shr    $0x1f,%eax
  401c3e:	89 44 24 14          	mov    %eax,0x14(%rsp)
  401c42:	e9 a4 fe ff ff       	jmpq   401aeb <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0xfb>
  401c47:	c6 44 24 14 01       	movb   $0x1,0x14(%rsp)
  401c4c:	e9 9a fe ff ff       	jmpq   401aeb <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0xfb>
  401c51:	bf c8 1d 40 00       	mov    $0x401dc8,%edi
  401c56:	e8 35 f2 ff ff       	callq  400e90 <_ZSt19__throw_logic_errorPKc@plt>
  401c5b:	e8 b0 f2 ff ff       	callq  400f10 <__stack_chk_fail@plt>
  401c60:	48 89 c5             	mov    %rax,%rbp
  401c63:	eb 0a                	jmp    401c6f <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0x27f>
  401c65:	48 89 c7             	mov    %rax,%rdi
  401c68:	eb 19                	jmp    401c83 <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0x293>
  401c6a:	e8 41 f3 ff ff       	callq  400fb0 <__cxa_end_catch@plt>
  401c6f:	49 8b 75 10          	mov    0x10(%r13),%rsi
  401c73:	4c 89 ef             	mov    %r13,%rdi
  401c76:	e8 35 fb ff ff       	callq  4017b0 <_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_12OM_DATA_TYPEESt10_Select1stIS9_ESt4lessIS5_ESaIS9_EE8_M_eraseEPSt13_Rb_tree_nodeIS9_E>
  401c7b:	48 89 ef             	mov    %rbp,%rdi
  401c7e:	e8 4d f3 ff ff       	callq  400fd0 <_Unwind_Resume@plt>
  401c83:	e8 c8 f1 ff ff       	callq  400e50 <__cxa_begin_catch@plt>
  401c88:	48 89 ef             	mov    %rbp,%rdi
  401c8b:	e8 40 f2 ff ff       	callq  400ed0 <_ZdlPv@plt>
  401c90:	e8 cb f2 ff ff       	callq  400f60 <__cxa_rethrow@plt>
  401c95:	48 89 c5             	mov    %rax,%rbp
  401c98:	eb d0                	jmp    401c6a <_ZNSt3mapINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE12OM_DATA_TYPESt4lessIS5_ESaISt4pairIKS5_S6_EEEC1ESt16initializer_listISB_ERKS8_RKSC_+0x27a>
  401c9a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401ca0 <__libc_csu_init>:
  401ca0:	41 57                	push   %r15
  401ca2:	41 56                	push   %r14
  401ca4:	41 89 ff             	mov    %edi,%r15d
  401ca7:	41 55                	push   %r13
  401ca9:	41 54                	push   %r12
  401cab:	4c 8d 25 2e 11 20 00 	lea    0x20112e(%rip),%r12        # 602de0 <__frame_dummy_init_array_entry>
  401cb2:	55                   	push   %rbp
  401cb3:	48 8d 2d 36 11 20 00 	lea    0x201136(%rip),%rbp        # 602df0 <__init_array_end>
  401cba:	53                   	push   %rbx
  401cbb:	49 89 f6             	mov    %rsi,%r14
  401cbe:	49 89 d5             	mov    %rdx,%r13
  401cc1:	4c 29 e5             	sub    %r12,%rbp
  401cc4:	48 83 ec 08          	sub    $0x8,%rsp
  401cc8:	48 c1 fd 03          	sar    $0x3,%rbp
  401ccc:	e8 1f f1 ff ff       	callq  400df0 <_init>
  401cd1:	48 85 ed             	test   %rbp,%rbp
  401cd4:	74 20                	je     401cf6 <__libc_csu_init+0x56>
  401cd6:	31 db                	xor    %ebx,%ebx
  401cd8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  401cdf:	00 
  401ce0:	4c 89 ea             	mov    %r13,%rdx
  401ce3:	4c 89 f6             	mov    %r14,%rsi
  401ce6:	44 89 ff             	mov    %r15d,%edi
  401ce9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  401ced:	48 83 c3 01          	add    $0x1,%rbx
  401cf1:	48 39 eb             	cmp    %rbp,%rbx
  401cf4:	75 ea                	jne    401ce0 <__libc_csu_init+0x40>
  401cf6:	48 83 c4 08          	add    $0x8,%rsp
  401cfa:	5b                   	pop    %rbx
  401cfb:	5d                   	pop    %rbp
  401cfc:	41 5c                	pop    %r12
  401cfe:	41 5d                	pop    %r13
  401d00:	41 5e                	pop    %r14
  401d02:	41 5f                	pop    %r15
  401d04:	c3                   	retq   
  401d05:	90                   	nop
  401d06:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  401d0d:	00 00 00 

0000000000401d10 <__libc_csu_fini>:
  401d10:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000401d14 <_fini>:
  401d14:	48 83 ec 08          	sub    $0x8,%rsp
  401d18:	48 83 c4 08          	add    $0x8,%rsp
  401d1c:	c3                   	retq   
