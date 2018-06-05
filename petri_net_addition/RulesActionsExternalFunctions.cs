// This file has been generated automatically by GrGen (www.grgen.net)
// Do not modify this file! Any changes will be lost!
// Generated from "Rules.grg" on 10/17/2017 2:16:10 PM CET
using System;
using System.Collections.Generic;
using GRGEN_LIBGR = de.unika.ipd.grGen.libGr;
using GRGEN_LGSP = de.unika.ipd.grGen.lgsp;
using GRGEN_MODEL = de.unika.ipd.grGen.Model_Rules;
using GRGEN_ACTIONS = de.unika.ipd.grGen.Action_Rules;

namespace de.unika.ipd.grGen.Action_Rules
{
    // The following filter functions are automatically generated, you don't need to supply any further implementation

    namespace na
    {
        public partial class MatchFilters
        {
            public static void Filter_TransformSingle_orderAscendingBy_order(GRGEN_LGSP.LGSPGraphProcessingEnvironment procEnv, GRGEN_LIBGR.IMatchesExact<na.Rule_TransformSingle.IMatch_TransformSingle> matches)
            {
                List<na.Rule_TransformSingle.IMatch_TransformSingle> matchesArray = matches.ToList();
                matchesArray.Sort(new Comparer_TransformSingle_orderAscendingBy_order());
                matches.FromList();
            }
            class Comparer_TransformSingle_orderAscendingBy_order : Comparer<na.Rule_TransformSingle.IMatch_TransformSingle>
            {
                public override int Compare(na.Rule_TransformSingle.IMatch_TransformSingle left, na.Rule_TransformSingle.IMatch_TransformSingle right)
                {
                    return left.var_order.CompareTo(right.var_order);
                }
            }
        }
    }

    // ------------------------------------------------------
}
