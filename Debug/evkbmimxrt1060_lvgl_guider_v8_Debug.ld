/*
 * GENERATED FILE - DO NOT EDIT
 * Copyright 2008-2013 Code Red Technologies Ltd,
 * Copyright 2013-2024 NXP
 * Generated linker script file for MIMXRT1062xxxxB
 * Created from linkscript.ldt by FMCreateLinkLibraries
 * Using Freemarker v2.3.30
 * MCUXpresso IDE v11.9.0 [Build 2144] [2024-01-05] on May 4, 2024, 1:30:11 PM
 */

INCLUDE "evkbmimxrt1060_lvgl_guider_v8_Debug_library.ld"
INCLUDE "evkbmimxrt1060_lvgl_guider_v8_Debug_memory.ld"

ENTRY(ResetISR)

SECTIONS
{
     /* Image Vector Table and Boot Data for booting from external flash */
    .boot_hdr : ALIGN(4)
    {
        FILL(0xff)
        __boot_hdr_start__ = ABSOLUTE(.) ;
        KEEP(*(.boot_hdr.conf))
        . = 0x1000 ;
        KEEP(*(.boot_hdr.ivt))
        . = 0x1020 ;
        KEEP(*(.boot_hdr.boot_data))
        . = 0x1030 ;
        KEEP(*(.boot_hdr.dcd_data))
        __boot_hdr_end__ = ABSOLUTE(.) ;
        . = 0x2000 ;
    } >BOARD_FLASH

    /* MAIN TEXT SECTION */
    .text : ALIGN(4)
    {
        FILL(0xff)
        __vectors_start__ = ABSOLUTE(.) ;
        KEEP(*(.isr_vector))
        /* Global Section Table */
        . = ALIGN(4) ;
        __section_table_start = .;
        __data_section_table = .;
        LONG(LOADADDR(.data));
        LONG(    ADDR(.data));
        LONG(  SIZEOF(.data));
        LONG(LOADADDR(.data_RAM2));
        LONG(    ADDR(.data_RAM2));
        LONG(  SIZEOF(.data_RAM2));
        LONG(LOADADDR(.data_RAM3));
        LONG(    ADDR(.data_RAM3));
        LONG(  SIZEOF(.data_RAM3));
        LONG(LOADADDR(.data_RAM4));
        LONG(    ADDR(.data_RAM4));
        LONG(  SIZEOF(.data_RAM4));
        LONG(LOADADDR(.data_RAM5));
        LONG(    ADDR(.data_RAM5));
        LONG(  SIZEOF(.data_RAM5));
        __data_section_table_end = .;
        __bss_section_table = .;
        LONG(    ADDR(.bss));
        LONG(  SIZEOF(.bss));
        LONG(    ADDR(.bss_RAM2));
        LONG(  SIZEOF(.bss_RAM2));
        LONG(    ADDR(.bss_RAM3));
        LONG(  SIZEOF(.bss_RAM3));
        LONG(    ADDR(.bss_RAM4));
        LONG(  SIZEOF(.bss_RAM4));
        LONG(    ADDR(.bss_RAM5));
        LONG(  SIZEOF(.bss_RAM5));
        __bss_section_table_end = .;
        __section_table_end = . ;
        /* End of Global Section Table */

        *(.after_vectors*)

       *(.text*)
       KEEP(*freertos*/tasks.o(.rodata*)) /* FreeRTOS Debug Config */
       *(.rodata .rodata.* .constdata .constdata.*)
       . = ALIGN(4);
            /* C++ constructors etc */
            . = ALIGN(4);
            KEEP(*(.init))
            
            . = ALIGN(4);
            __preinit_array_start = .;
            KEEP (*(.preinit_array))
            __preinit_array_end = .;
            
            . = ALIGN(4);
            __init_array_start = .;
            KEEP (*(SORT(.init_array.*)))
            KEEP (*(.init_array))
            __init_array_end = .;
            
            KEEP(*(.fini));
            
            . = ALIGN(4);
            KEEP (*crtbegin.o(.ctors))
            KEEP (*(EXCLUDE_FILE (*crtend.o) .ctors))
            KEEP (*(SORT(.ctors.*)))
            KEEP (*crtend.o(.ctors))
            
            . = ALIGN(4);
            KEEP (*crtbegin.o(.dtors))
            KEEP (*(EXCLUDE_FILE (*crtend.o) .dtors))
            KEEP (*(SORT(.dtors.*)))
            KEEP (*crtend.o(.dtors))
            . = ALIGN(4);
            /* End C++ */
    } > BOARD_FLASH
    /*
     * for exception handling/unwind - some Newlib functions (in common
     * with C++ and STDC++) use this.
     */
    .ARM.extab : ALIGN(4)
    {
        *(.ARM.extab* .gnu.linkonce.armextab.*)
    } > BOARD_FLASH

    .ARM.exidx : ALIGN(4)
    {
        __exidx_start = .;
        *(.ARM.exidx* .gnu.linkonce.armexidx.*)
        __exidx_end = .;
    } > BOARD_FLASH
 
    _etext = .;
        
    /* DATA section for NCACHE_REGION */

    .data_RAM2 : ALIGN(4)
    {
        FILL(0xff)
        PROVIDE(__start_data_RAM2 = .) ;
        PROVIDE(__start_data_NCACHE_REGION = .) ;
        *(.ramfunc.$RAM2)
        *(.ramfunc.$NCACHE_REGION)
       *(NonCacheable.init)
        *(.data.$RAM2)
        *(.data.$NCACHE_REGION)
        *(.data.$RAM2.*)
        *(.data.$NCACHE_REGION.*)
        . = ALIGN(4) ;
        PROVIDE(__end_data_RAM2 = .) ;
        PROVIDE(__end_data_NCACHE_REGION = .) ;
     } > NCACHE_REGION AT>BOARD_FLASH

    /* DATA section for SRAM_DTC */

    .data_RAM3 : ALIGN(4)
    {
        FILL(0xff)
        PROVIDE(__start_data_RAM3 = .) ;
        PROVIDE(__start_data_SRAM_DTC = .) ;
        *(.ramfunc.$RAM3)
        *(.ramfunc.$SRAM_DTC)
        *(.data.$RAM3)
        *(.data.$SRAM_DTC)
        *(.data.$RAM3.*)
        *(.data.$SRAM_DTC.*)
        . = ALIGN(4) ;
        PROVIDE(__end_data_RAM3 = .) ;
        PROVIDE(__end_data_SRAM_DTC = .) ;
     } > SRAM_DTC AT>BOARD_FLASH

    /* DATA section for SRAM_ITC */

    .data_RAM4 : ALIGN(4)
    {
        FILL(0xff)
        PROVIDE(__start_data_RAM4 = .) ;
        PROVIDE(__start_data_SRAM_ITC = .) ;
        *(.ramfunc.$RAM4)
        *(.ramfunc.$SRAM_ITC)
        *(.data.$RAM4)
        *(.data.$SRAM_ITC)
        *(.data.$RAM4.*)
        *(.data.$SRAM_ITC.*)
        . = ALIGN(4) ;
        PROVIDE(__end_data_RAM4 = .) ;
        PROVIDE(__end_data_SRAM_ITC = .) ;
     } > SRAM_ITC AT>BOARD_FLASH

    /* DATA section for SRAM_OC */

    .data_RAM5 : ALIGN(4)
    {
        FILL(0xff)
        PROVIDE(__start_data_RAM5 = .) ;
        PROVIDE(__start_data_SRAM_OC = .) ;
        *(.ramfunc.$RAM5)
        *(.ramfunc.$SRAM_OC)
       KEEP(*(FrameBuffer))
        *(.data.$RAM5)
        *(.data.$SRAM_OC)
        *(.data.$RAM5.*)
        *(.data.$SRAM_OC.*)
        . = ALIGN(4) ;
        PROVIDE(__end_data_RAM5 = .) ;
        PROVIDE(__end_data_SRAM_OC = .) ;
     } > SRAM_OC AT>BOARD_FLASH

    /* MAIN DATA SECTION */
    .uninit_RESERVED (NOLOAD) : ALIGN(4)
    {
        _start_uninit_RESERVED = .;
        KEEP(*(.bss.$RESERVED*))
       . = ALIGN(4) ;
        _end_uninit_RESERVED = .;
    } > BOARD_SDRAM AT> BOARD_SDRAM

    /* Main DATA section (BOARD_SDRAM) */
    .data : ALIGN(4)
    {
       FILL(0xff)
       _data = . ;
       PROVIDE(__start_data_RAM = .) ;
       PROVIDE(__start_data_BOARD_SDRAM = .) ;
       *(vtable)
       *(.ramfunc*)
       KEEP(*(CodeQuickAccess))
       KEEP(*(DataQuickAccess))
       *(RamFunction)
       *(.data*)
       . = ALIGN(4) ;
       _edata = . ;
       PROVIDE(__end_data_RAM = .) ;
       PROVIDE(__end_data_BOARD_SDRAM = .) ;
    } > BOARD_SDRAM AT>BOARD_FLASH

    /* BSS section for NCACHE_REGION */
    .bss_RAM2 (NOLOAD) : ALIGN(4)
    {
       PROVIDE(__start_bss_RAM2 = .) ;
       PROVIDE(__start_bss_NCACHE_REGION = .) ;
       *(NonCacheable)
       *(.bss.$RAM2)
       *(.bss.$NCACHE_REGION)
       *(.bss.$RAM2.*)
       *(.bss.$NCACHE_REGION.*)
       . = ALIGN (. != 0 ? 4 : 1) ; /* avoid empty segment */
       PROVIDE(__end_bss_RAM2 = .) ;
       PROVIDE(__end_bss_NCACHE_REGION = .) ;
    } > NCACHE_REGION AT> NCACHE_REGION

    /* BSS section for SRAM_DTC */
    .bss_RAM3 (NOLOAD) : ALIGN(4)
    {
       PROVIDE(__start_bss_RAM3 = .) ;
       PROVIDE(__start_bss_SRAM_DTC = .) ;
       *(.bss.$RAM3)
       *(.bss.$SRAM_DTC)
       *(.bss.$RAM3.*)
       *(.bss.$SRAM_DTC.*)
       . = ALIGN (. != 0 ? 4 : 1) ; /* avoid empty segment */
       PROVIDE(__end_bss_RAM3 = .) ;
       PROVIDE(__end_bss_SRAM_DTC = .) ;
    } > SRAM_DTC AT> SRAM_DTC

    /* BSS section for SRAM_ITC */
    .bss_RAM4 (NOLOAD) : ALIGN(4)
    {
       PROVIDE(__start_bss_RAM4 = .) ;
       PROVIDE(__start_bss_SRAM_ITC = .) ;
       *(.bss.$RAM4)
       *(.bss.$SRAM_ITC)
       *(.bss.$RAM4.*)
       *(.bss.$SRAM_ITC.*)
       . = ALIGN (. != 0 ? 4 : 1) ; /* avoid empty segment */
       PROVIDE(__end_bss_RAM4 = .) ;
       PROVIDE(__end_bss_SRAM_ITC = .) ;
    } > SRAM_ITC AT> SRAM_ITC

    /* BSS section for SRAM_OC */
    .bss_RAM5 (NOLOAD) : ALIGN(4)
    {
       PROVIDE(__start_bss_RAM5 = .) ;
       PROVIDE(__start_bss_SRAM_OC = .) ;
       *(.bss.$RAM5)
       *(.bss.$SRAM_OC)
       *(.bss.$RAM5.*)
       *(.bss.$SRAM_OC.*)
       . = ALIGN (. != 0 ? 4 : 1) ; /* avoid empty segment */
       PROVIDE(__end_bss_RAM5 = .) ;
       PROVIDE(__end_bss_SRAM_OC = .) ;
    } > SRAM_OC AT> SRAM_OC

    /* MAIN BSS SECTION */
    .bss (NOLOAD) : ALIGN(4)
    {
        _bss = .;
        PROVIDE(__start_bss_RAM = .) ;
        PROVIDE(__start_bss_BOARD_SDRAM = .) ;
        *(.bss*)
        *(COMMON)
        . = ALIGN(4) ;
        _ebss = .;
        PROVIDE(__end_bss_RAM = .) ;
        PROVIDE(__end_bss_BOARD_SDRAM = .) ;
        PROVIDE(end = .);
    } > BOARD_SDRAM AT> BOARD_SDRAM

    /* NOINIT section for NCACHE_REGION */
    .noinit_RAM2 (NOLOAD) : ALIGN(4)
    {
       PROVIDE(__start_noinit_RAM2 = .) ;
       PROVIDE(__start_noinit_NCACHE_REGION = .) ;
       *(.noinit.$RAM2)
       *(.noinit.$NCACHE_REGION)
       *(.noinit.$RAM2.*)
       *(.noinit.$NCACHE_REGION.*)
       . = ALIGN(4) ;
       PROVIDE(__end_noinit_RAM2 = .) ;
       PROVIDE(__end_noinit_NCACHE_REGION = .) ;
    } > NCACHE_REGION AT> NCACHE_REGION

    /* NOINIT section for SRAM_DTC */
    .noinit_RAM3 (NOLOAD) : ALIGN(4)
    {
       PROVIDE(__start_noinit_RAM3 = .) ;
       PROVIDE(__start_noinit_SRAM_DTC = .) ;
       *(.noinit.$RAM3)
       *(.noinit.$SRAM_DTC)
       *(.noinit.$RAM3.*)
       *(.noinit.$SRAM_DTC.*)
       . = ALIGN(4) ;
       PROVIDE(__end_noinit_RAM3 = .) ;
       PROVIDE(__end_noinit_SRAM_DTC = .) ;
    } > SRAM_DTC AT> SRAM_DTC

    /* NOINIT section for SRAM_ITC */
    .noinit_RAM4 (NOLOAD) : ALIGN(4)
    {
       PROVIDE(__start_noinit_RAM4 = .) ;
       PROVIDE(__start_noinit_SRAM_ITC = .) ;
       *(.noinit.$RAM4)
       *(.noinit.$SRAM_ITC)
       *(.noinit.$RAM4.*)
       *(.noinit.$SRAM_ITC.*)
       . = ALIGN(4) ;
       PROVIDE(__end_noinit_RAM4 = .) ;
       PROVIDE(__end_noinit_SRAM_ITC = .) ;
    } > SRAM_ITC AT> SRAM_ITC

    /* NOINIT section for SRAM_OC */
    .noinit_RAM5 (NOLOAD) : ALIGN(4)
    {
       PROVIDE(__start_noinit_RAM5 = .) ;
       PROVIDE(__start_noinit_SRAM_OC = .) ;
       *(.noinit.$RAM5)
       *(.noinit.$SRAM_OC)
       *(.noinit.$RAM5.*)
       *(.noinit.$SRAM_OC.*)
       . = ALIGN(4) ;
       PROVIDE(__end_noinit_RAM5 = .) ;
       PROVIDE(__end_noinit_SRAM_OC = .) ;
    } > SRAM_OC AT> SRAM_OC

    /* DEFAULT NOINIT SECTION */
    .noinit (NOLOAD): ALIGN(4)
    {
        _noinit = .;
        PROVIDE(__start_noinit_RAM = .) ;
        PROVIDE(__start_noinit_BOARD_SDRAM = .) ;
        *(.noinit*)
         . = ALIGN(4) ;
        _end_noinit = .;
       PROVIDE(__end_noinit_RAM = .) ;
       PROVIDE(__end_noinit_BOARD_SDRAM = .) ;        
    } > BOARD_SDRAM AT> BOARD_SDRAM

    /* Reserve and place Heap within memory map */
    _HeapSize = 0x1800000;
    .heap (NOLOAD) :  ALIGN(4)
    {
        _pvHeapStart = .;
        . += _HeapSize;
        . = ALIGN(4);
        _pvHeapLimit = .;
    } > BOARD_SDRAM

     _StackSize = 0x1000;
     /* Reserve space in memory for Stack */
    .heap2stackfill (NOLOAD) :
    {
        . += _StackSize;
    } > BOARD_SDRAM
    /* Locate actual Stack in memory map */
    .stack ORIGIN(BOARD_SDRAM) + LENGTH(BOARD_SDRAM) - _StackSize - 0 (NOLOAD) :  ALIGN(4)
    {
        _vStackBase = .;
        . = ALIGN(4);
        _vStackTop = . + _StackSize;
    } > BOARD_SDRAM

    /* Provide basic symbols giving location and size of main text
     * block, including initial values of RW data sections. Note that
     * these will need extending to give a complete picture with
     * complex images (e.g multiple Flash banks).
     */
    _image_start = LOADADDR(.text);
    _image_end = LOADADDR(.data) + SIZEOF(.data);
    _image_size = _image_end - _image_start;
}