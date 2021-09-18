# elf-encrypt-learning

## raw

```bash
$ ./checksec.sh/checksec --file=bin/hello                  
RELRO           STACK CANARY      NX            PIE             RPATH      RUNPATH      Symbols         FORTIFY Fortified       Fortifiable     FILE
No RELRO        No canary found   NX enabled    No PIE          No RPATH   No RUNPATH   2172 Symbols      No    0               0               bin/hello
```

## pie

```bash
$ ./checksec.sh/checksec --file=bin/hello-pie
RELRO           STACK CANARY      NX            PIE             RPATH      RUNPATH      Symbols         FORTIFY Fortified       Fortifiable     FILE
Partial RELRO   No canary found   NX enabled    PIE enabled     No RPATH   No RUNPATH   2174 Symbols      No    0               0               bin/hello-pie
```

## obfs

```bash
$ ./checksec.sh/checksec --file=bin/hello-garble
RELRO           STACK CANARY      NX            PIE             RPATH      RUNPATH      Symbols         FORTIFY Fortified       Fortifiable     FILE
No RELRO        No canary found   NX enabled    No PIE          No RPATH   No RUNPATH   No Symbols        No    0               0               bin/hello-garble
```

## obfs + pie

```bash
$ ./checksec.sh/checksec --file=bin/garble-pie
RELRO           STACK CANARY      NX            PIE             RPATH      RUNPATH      Symbols         FORTIFY Fortified       Fortifiable     FILE
Partial RELRO   No canary found   NX enabled    PIE enabled     No RPATH   No RUNPATH   No Symbols        No    0               0               bin/garble-pie
```

## upx

```bash
RELRO           STACK CANARY      NX            PIE             RPATH      RUNPATH      Symbols         FORTIFY Fortified       Fortifiable     FILE
No RELRO        No canary found   NX enabled    No PIE          No RPATH   No RUNPATH   No Symbols        No    0               0               bin/upx
```
