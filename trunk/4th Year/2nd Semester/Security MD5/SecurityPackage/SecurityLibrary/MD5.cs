﻿namespace SecurityLibrary
{
    using System;
    using System.Collections.Generic;
    using System.Windows.Forms;

    /// <summary>
    /// MD5 Algorithm, packets of 512 bits
    /// </summary>
    public class MD5 : Cryptography
    {
        #region Const Members

        /// <summary>
        /// Some Const Value
        /// </summary>
        private const int BLOCKLENGTH = 512, CONGRUENTTO = 448, ROUNDS = 4, STEPS = 16, WORDSIZE = 32, ALLSTEPS = ROUNDS * STEPS;

        #endregion Const Members

        #region Members

        /// <summary>
        /// Local Registers
        /// </summary>
        private uint a, b, c, d;

        /// <summary>
        /// T Vector, that holdes the value for all the rounds
        /// </summary>
        private uint[] t = new uint[ALLSTEPS];

        /// <summary>
        /// Chaining Vector
        /// </summary>
        private uint[] cv = new uint[4];

        /// <summary>
        /// Each Block is divided into 16 part, each of 32 bit, that is x, a tmp vector for the parts of the block
        /// </summary>
        private uint[] x = new uint[STEPS];

        /// <summary>
        /// Values to shift by in all the rounds
        /// </summary>
        private int[,] s;

        /// <summary>
        /// The Variable that holds the primitive logic function for all the iterations
        /// </summary>
        private PrimitiveLogicFunction function;

        #endregion Members

        #region Constructor

        /// <summary>
        /// Initializes a new instance of the MD5 class
        /// </summary>
        public MD5()
        {
            this.Do_All_Initializations();
        }

        #endregion Constructor

        #region Delegates

        /// <summary>
        /// Delegate for the primitive logic function
        /// </summary>
        /// <param name="myB">register b</param>
        /// <param name="myC">register c</param>
        /// <param name="myD">register d</param>
        /// <returns>result for this primitivefunction</returns>
        private delegate uint PrimitiveLogicFunction(uint myB, uint myC, uint myD);

        #endregion Delegates

        #region Properties

        /// <summary>
        /// Gets T Vetcor holds values for the all the rounds
        /// </summary>
        public uint[] T
        {
            get { return this.t; }
        }

        /// <summary>
        /// Gets Chaining Vector
        /// </summary>
        public uint[] CV
        {
            get { return this.cv; }
        }

        /// <summary>
        /// Gets Values to shift by in all the rounds
        /// </summary>
        public int[,] S
        {
            get { return this.s; }
        }

        #endregion Properties

        #region PublicStaticFunctions

        /// <summary>
        /// Circular Shifting for an uint value
        /// </summary>
        /// <param name="value">Value to operate on</param>
        /// <param name="numOfShifts">number of shifts wanted</param>
        /// <param name="direction">LeftRightAlignment Enum indicates wether it is a (Left || Right) Shift</param>
        /// <returns>Result from Circular Shifting</returns>
        public static uint CircularShift(uint value, int numOfShifts, LeftRightAlignment direction)
        {
            string test = Convertors.FromIntToBinary(value);

            // Set mirror to "0"
            uint mirror = 0;

            // Set printer to ("1" then 31 "0" if Left Shift) || (31 "0" Then 1 "1" if Right Shift)  10000000000000000000000000000000 || 00000000000000000000000000000001
            uint printer = direction == LeftRightAlignment.Left ? (uint)0x80000000 : (uint)0x00000001;

            test = Convertors.FromIntToBinary(printer);

            // I will get the bits the will be lost after the shifting operation, then will add them.
            // So for the
            //           Left Shift : Get the Most Right (numOfShifts) bits, that will be lost, then add them after the shifting is done
            //           Right Shift: Get the Most Left  (numOfShifts) bits, that will be lost, then add them after the shifting is done

            // For the number of numOfShifts, set the most (Left if Left) || (Right if Right) bits in mirror to "1", cause that the side that will lose the bits
            for (int i = 0; i < numOfShifts; i++)
            {
                // ORing "0" | "1", gets "1"
                mirror = mirror | printer;

                // Shift the "1" in the printer to the (Right if Left) || (Left if Right) !!
                printer = direction == LeftRightAlignment.Left ? printer >> 1 : printer << 1;
            }

            test = Convertors.FromIntToBinary(mirror);

            // ANDing mirror and the input value, will get the most (Left if Left) || (Right if Right) bits by the number of numOfShifts
            mirror = mirror & value;

            test = Convertors.FromIntToBinary(mirror);

            // Shift mirror by 32 - #numOfShifts, so that u get the values to the most (Right if Left) || (Left if Right), cause that is the new place for it
            mirror = direction == LeftRightAlignment.Left ? mirror >> (32 - numOfShifts) : mirror << (32 - numOfShifts);

            test = Convertors.FromIntToBinary(mirror);

            // Shift a
            value = direction == LeftRightAlignment.Left ? value << numOfShifts : value >> numOfShifts;

            test = Convertors.FromIntToBinary(value);

            // then add the missing bits, by just ORing mirror and result value from shifting
            value = value | mirror;

            test = Convertors.FromIntToBinary(value);

            return value;
        }

        #endregion PublicStaticFunctions

        #region PublicFunctions

        /// <summary>
        /// Encrypt PlainText
        /// </summary>
        public override void Encrypt()
        {
            int tmpLength;

            uint[] tmpVector = new uint[4];

            // Convert to Binary
            this._pt = Convertors.FromTextToBinary(_pt);

            // Save Original Length
            tmpLength = this._pt.Length;

            // Append Padding Bits
            this.AppendPaddingBits();

            // Append Original Length of the Message, in little Endian
            this.AppendLength(tmpLength);

            this.Do_All_Initializations();

            // Foreach block, apply it to the H_MD5 algorithm
            for (int i = 0; i < this._pt.Length / BLOCKLENGTH; i++)
            {
                // Save Current Values
                this.cv.CopyTo(tmpVector, 0);

                // Send this block to the H_MD5 block hash generator
                this.H_MD5(_pt.Substring(i * BLOCKLENGTH, BLOCKLENGTH));

                // Add all to the original values
                for (int j = 0; j < 4; j++)
                {
                    this.cv[j] = this.cv[j] + tmpVector[j];
                }
            }

            // Clear Cipher Text
            this._ct = string.Empty;

            for (int j = 0; j < 4; j++)
            {
                this._ct += Convertors.FromIntToHex(Convertors.ToLittleEndian(this.cv[j]));
                //this._ct += Convertors.FromIntToHex(this.cv[j]);
            }
        }

        /// <summary>
        /// Decrypt CipherText
        /// </summary>
        public override void Decrypt()
        {
            this._ct = "No Decryption for the MD5";
        }

        /// <summary>
        /// Get the Cryptography ID
        /// </summary>
        /// <returns>ID for this Algorithm</returns>
        public override int GetID()
        {
            return 4;
        }

        /// <summary>
        /// Get Cryptography Type for this algorithm
        /// </summary>
        /// <returns>Cryptography Type</returns>
        public override CryptographyType GetCryptographyType()
        {
            return CryptographyType.MD5;
        }

        #endregion PublicFunctions

        #region Static_PrimitiveLogicFunctions

        /// <summary>
        /// Function F, 1 of 4
        /// </summary>
        /// <param name="myB">register B</param>
        /// <param name="myC">register C</param>
        /// <param name="myD">register D</param>
        /// <returns>Result of F Function</returns>
        private static uint F(uint myB, uint myC, uint myD)
        {
            return (myB & myC) | (~myB & myD);
        }

        /// <summary>
        /// Function G, 1 of 4
        /// </summary>
        /// <param name="myB">register B</param>
        /// <param name="myC">register C</param>
        /// <param name="myD">register D</param>
        /// <returns>Result of G Function</returns>
        private static uint G(uint myB, uint myC, uint myD)
        {
            return (myB & myD) | (myC & ~myD);
        }

        /// <summary>
        /// Function H, 1 of 4
        /// </summary>
        /// <param name="myB">register B</param>
        /// <param name="myC">register C</param>
        /// <param name="myD">register D</param>
        /// <returns>Result of H Function</returns>
        private static uint H(uint myB, uint myC, uint myD)
        {
            return myB ^ myC ^ myD;
        }

        /// <summary>
        /// Function I, 1 of 4
        /// </summary>
        /// <param name="myB">register B</param>
        /// <param name="myC">register C</param>
        /// <param name="myD">register D</param>
        /// <returns>Result of I Function</returns>
        private static uint I(uint myB, uint myC, uint myD)
        {
            return myC ^ (myB | ~myD);
        }

        #endregion Static_PrimitiveLogicFunctions

        #region Static_HelpingFunctions

        /// <summary>
        /// Calculate Required PaddingLength
        /// </summary>
        /// <param name="length">Current Length</param>
        /// <returns>Padding Length</returns>
        private static int CalcPaddingLength(int length)
        {
            length = length % BLOCKLENGTH;

            return (length >= CONGRUENTTO) ? 960 - length : CONGRUENTTO - length;
        }

        /// <summary>
        /// Calculates the k, which is the Index for each step in each round for XArr
        /// </summary>
        /// <param name="round">Round Number</param>
        /// <param name="step">Step Number</param>
        /// <returns>K :: Index in XArr</returns>
        private static int Get_XArr_Index(int round, int step)
        {
            int value = 0;

            switch (round)
            {
                case 0:
                    value = step;
                    break;
                case 1:
                    value = (1 + (5 * step)) % 16;
                    break;
                case 2:
                    value = (5 + (3 * step)) % 16;
                    break;
                case 3:
                    value = (7 * step) % 16;
                    break;
                default:
                    break;
            }

            return value;
        }

        #endregion Static_HelpingFunctions

        #region AlgorithmParts

        /// <summary>
        /// Convert to Binary, then Add Padding Length
        /// </summary>
        private void AppendPaddingBits()
        {
            // Add Padding
            int i = CalcPaddingLength(_pt.Length);

            if (i-- > 0)
            {
                this._pt += '1';

                for (; i > 0; i--)
                {
                    this._pt += '0';
                }
            }
        }

        /// <summary>
        /// Add Padding Length
        /// </summary>
        /// <param name="origLength">Original Length</param>
        private void AppendLength(int origLength)
        {
            this._pt += Convertors.ToLittleEndian(Convertors.FromIntToBinary(origLength, 64));
            //this._pt += Convertors.FromIntToBinary(origLength, 64);
        }

        /// <summary>
        /// Sets the appropriate logic fuction to the delegate, according to the function Num (0:3)
        /// </summary>
        /// <param name="iteration">iteration num</param>
        private void SetPrimitiveLogicFunction(int iteration)
        {
            switch (iteration)
            {
                case 0:
                    this.function = new PrimitiveLogicFunction(MD5.F);
                    break;
                case 1:
                    this.function = new PrimitiveLogicFunction(MD5.G);
                    break;
                case 2:
                    this.function = new PrimitiveLogicFunction(MD5.H);
                    break;
                case 3:
                    this.function = new PrimitiveLogicFunction(MD5.I);
                    break;
            }
        }

        /// <summary>
        /// This function uses the cv member, so it should be initialized with iv before it is first called, and it'll leave cv with the new value
        /// </summary>
        /// <param name="part">current block to work on</param>
        private void H_MD5(string part)
        {
            // temp value !
            uint tmp;
            List<string> myList = new List<string>();
            string mystr;

            // Set the vector of X
            for (int i = 0; i < STEPS; i++)
            {
                this.x[i] = Convertors.ToLittleEndian((uint)Convertors.FromTextToInt32(part.Substring(i * WORDSIZE, WORDSIZE)));
            }

            // Foreach Round
            for (int j = 0; j < ROUNDS; j++)
            {
                // Set the PLF::Primitive Logic Function for this round
                this.SetPrimitiveLogicFunction(j);

                // Foreach Step in this Round
                for (int i = 0; i < STEPS; i++)
                {
                    tmp = this.function(this.cv[1], this.cv[2], this.cv[3]);
                    mystr = Convertors.FromIntToBinary(tmp);

                    tmp += this.cv[0];
                    mystr = Convertors.FromIntToBinary(tmp);

                    tmp += this.x[MD5.Get_XArr_Index(j, i)];
                    mystr = Convertors.FromIntToBinary(tmp);

                    tmp += this.t[(j * STEPS) + i];
                    mystr = Convertors.FromIntToBinary(tmp);

                    tmp = MD5.CircularShift(tmp, this.s[j, i % 4], LeftRightAlignment.Left);
                    mystr = Convertors.FromIntToBinary(tmp);

                    tmp += this.cv[1];
                    mystr = Convertors.FromIntToBinary(tmp);

                    this.cv[0] = this.cv[3];
                    this.cv[3] = this.cv[2];
                    this.cv[2] = this.cv[1];
                    this.cv[1] = tmp;

                    myList.Clear();
                    for (int x = 0; x < 4; x++)
                    {
                        myList.Add(Convertors.FromIntToBinary(this.cv[x]));
                    }
                }
            }
        }

        #endregion AlgorithmParts

        #region Initializations

        /// <summary>
        /// Call all the Initializations function
        /// </summary>
        private void Do_All_Initializations()
        {
            // Initialize MD Buffer
            this.ResetRegisters();

            // Initialize T Vector
            this.Initialize_T_Vector();

            // Set CV by the InitialValues (IV)
            this.Set_InitialVector_Values();

            // Initialize the Shifting values for all the rounds
            this.Initailize_SVector_Values();
        }

        /// <summary>
        /// Reset the values of the registers
        /// </summary>
        private void ResetRegisters()
        {
            this.a = 0x67452301;
            this.b = 0xefcdab89;
            this.c = 0x98badcfe;
            this.d = 0x10325476;
        }

        /// <summary>
        /// Initialize T Vector values
        /// </summary>
        private void Initialize_T_Vector()
        {
            for (int i = 0; i < ALLSTEPS; i++)
            {
                this.t[i] = (uint)((long)Math.Pow(2, 32) * Math.Abs(Math.Sin(i + 1)));
            }
        }

        /// <summary>
        /// Sets the Initial Vector values to the Chaining Vector
        /// </summary>
        private void Set_InitialVector_Values()
        {
            this.cv = new uint[] { this.a, this.b, this.c, this.d };
        }

        /// <summary>
        /// Initialize Shifting Values Vector for all the rounds
        /// </summary>
        private void Initailize_SVector_Values()
        {
            // Each Round have array with it's index starting from 0, each array have 4 elements should be repeated for the 16 steps
            this.s = new int[,] { { 7, 12, 17, 22 }, { 5, 9, 14, 20 }, { 4, 11, 16, 23 }, { 6, 10, 15, 21 } };
        }

        #endregion Initializations
    }
}