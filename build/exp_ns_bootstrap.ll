; ModuleID = 'simplex_program'
target triple = "x86_64-apple-macosx14.0.0"

declare ptr @malloc(i64)
declare void @free(ptr)
declare void @intrinsic_println(ptr)
declare void @intrinsic_print(ptr)
declare void @"print_i64"(i64)
declare ptr @intrinsic_int_to_string(i64)
declare ptr @intrinsic_string_new(ptr)
declare ptr @intrinsic_string_from_char(i64)
declare i64 @intrinsic_string_len(ptr)
declare ptr @intrinsic_string_concat(ptr, ptr)
declare ptr @intrinsic_string_slice(ptr, i64, i64)
declare i64 @intrinsic_string_char_at(ptr, i64)
declare i1 @intrinsic_string_eq(ptr, ptr)
declare i64 @intrinsic_string_to_int(ptr)
declare i64 @"String_from"(i64)
declare i64 @"String_len"(i64)
declare ptr @intrinsic_vec_new()
declare void @intrinsic_vec_push(ptr, ptr)
declare ptr @intrinsic_vec_get(ptr, i64)
declare i64 @intrinsic_vec_len(ptr)
declare void @intrinsic_vec_set(ptr, i64, ptr)
declare ptr @intrinsic_vec_pop(ptr)
declare void @intrinsic_vec_clear(ptr)
declare void @intrinsic_vec_remove(ptr, i64)
declare ptr @intrinsic_get_args()
declare ptr @intrinsic_read_file(ptr)
declare void @intrinsic_write_file(ptr, ptr)
declare ptr @store_ptr(ptr, i64, ptr)
declare ptr @store_i64(ptr, i64, i64)
declare ptr @load_ptr(ptr, i64)
declare i64 @load_i64(ptr, i64)
; Timing intrinsics
declare i64 @intrinsic_get_time_ms()
declare i64 @intrinsic_get_time_us()
declare i64 @intrinsic_get_time_ns()
; Float bit conversion intrinsics
declare i64 @"f64_to_bits"(double)
declare i64 @"bits_to_f64"(i64)
; Arena allocator intrinsics
declare ptr @intrinsic_arena_create(i64)
declare ptr @intrinsic_arena_alloc(ptr, i64)
declare void @intrinsic_arena_reset(ptr)
declare void @intrinsic_arena_free(ptr)
declare i64 @intrinsic_arena_used(ptr)
; StringBuilder intrinsics
declare ptr @intrinsic_sb_new()
declare ptr @intrinsic_sb_new_cap(i64)
declare void @intrinsic_sb_append(ptr, ptr)
declare void @intrinsic_sb_append_char(ptr, i64)
declare void @intrinsic_sb_append_i64(ptr, i64)
declare ptr @intrinsic_sb_to_string(ptr)
declare void @intrinsic_sb_clear(ptr)
declare void @intrinsic_sb_free(ptr)
declare i64 @intrinsic_sb_len(ptr)
; File I/O intrinsics
declare ptr @intrinsic_getenv(ptr)
declare i64 @intrinsic_file_exists(ptr)
declare i64 @intrinsic_is_file(ptr)
declare i64 @intrinsic_is_directory(ptr)
declare i64 @intrinsic_file_size(ptr)
declare i64 @intrinsic_file_mtime(ptr)
declare i64 @intrinsic_remove_path(ptr)
declare i64 @intrinsic_mkdir_p(ptr)
declare ptr @intrinsic_get_cwd()
declare i64 @intrinsic_set_cwd(ptr)
declare ptr @intrinsic_list_dir(ptr)
declare ptr @intrinsic_path_join(ptr, ptr)
declare ptr @intrinsic_path_dirname(ptr)
declare ptr @intrinsic_path_basename(ptr)
declare ptr @intrinsic_path_extension(ptr)
declare i64 @file_copy(ptr, ptr)
declare i64 @file_rename(ptr, ptr)
declare void @stderr_write(ptr)
declare void @stderr_writeln(ptr)
; Error handling intrinsics
declare void @intrinsic_panic(ptr)
declare void @intrinsic_print_stack_trace()
; Process intrinsics
declare i64 @intrinsic_process_run(ptr)
declare ptr @intrinsic_process_output(ptr)
; Phase 20: REPL/I/O intrinsics
declare ptr @intrinsic_read_line()
declare i64 @intrinsic_is_tty()
declare i64 @intrinsic_stdin_has_data()
declare i64 @intrinsic_string_hash(ptr)
declare i64 @intrinsic_string_find(ptr, ptr, i64)
declare ptr @intrinsic_string_trim(ptr)
declare ptr @intrinsic_string_split(ptr, ptr)
declare i64 @intrinsic_string_starts_with(ptr, ptr)
declare i64 @intrinsic_string_ends_with(ptr, ptr)
declare i64 @intrinsic_string_contains(ptr, ptr)
declare ptr @intrinsic_string_replace(ptr, ptr, ptr)
declare ptr @intrinsic_string_lines(ptr)
declare ptr @intrinsic_string_join(ptr, ptr)
declare ptr @intrinsic_string_to_lowercase(ptr)
declare ptr @intrinsic_string_to_uppercase(ptr)
declare i64 @intrinsic_string_compare(ptr, ptr)
declare i64 @intrinsic_copy_file(ptr, ptr)
declare ptr @intrinsic_get_home_dir()
declare i64 @cli_getenv(i64)
declare i64 @"env_get"(i64)
declare i64 @file_read(i64)
declare void @file_write(i64, i64)
declare i64 @remove_path(i64)
declare i64 @f64_parse(ptr)
declare i64 @"make_sx_string"(i64)
; SLM native bindings
declare i64 @"slm_native_load"(i64, i64, i64)
declare i64 @"slm_native_unload"(i64)
declare i64 @"slm_native_create_context"(i64, i64)
declare i64 @"slm_native_destroy_context"(i64)
declare i64 @"slm_native_tokenize"(i64, i64)
declare i64 @"slm_native_infer"(i64, i64, i64)
declare i64 @"slm_native_generate"(i64, i64, i64, i64)
declare i64 @"slm_native_embed"(i64, i64)
declare i64 @"slm_native_similarity"(i64, i64)
declare i64 @"slm_native_context_size"(i64)
declare i64 @"slm_native_embedding_size"(i64)
declare i64 @"slm_native_get_model_info"(i64)
; Generator intrinsics
declare i64 @generator_yield(i64)
declare i64 @generator_new(i64)
declare i64 @generator_next(i64)
declare i64 @generator_done(i64)
; Belief guard intrinsics
declare i64 @belief_guard_get_confidence(i64)
declare i64 @belief_guard_get_derivative(i64)
declare i64 @belief_register(i64, double, double)
declare i64 @belief_update(i64, double)
declare i64 @belief_update_dual(i64, double, double)
declare double @belief_get_value(i64)
declare i64 @belief_register_i64(i64, i64, i64)
declare i64 @belief_update_i64(i64, i64)
declare i64 @belief_update_dual_i64(i64, i64, i64)
; Belief suspend/wake intrinsics
declare i64 @belief_suspend_receive(i64, i64, i64, i64, i64, double, i64, i64)
declare i64 @belief_cancel_suspend(i64)
declare i64 @belief_suspended_count()
declare i64 @belief_get_actor_suspends(i64)
declare i64 @belief_clear_actor_suspends(i64)
declare i64 @belief_suspend_get_belief(i64)
declare i64 @belief_suspend_get_actor(i64)
declare i64 @belief_suspend_get_duration_ms(i64)
declare i64 @future_poll(i64)
declare i64 @future_ready(i64)
declare i64 @future_pending()
declare i64 @executor_run(i64)
declare i64 @executor_spawn(i64)
declare i64 @block_on(i64)
declare i64 @async_join(i64, i64)
declare i64 @join_result1(i64)
declare i64 @join_result2(i64)
declare i64 @async_select(i64, i64)
declare i64 @select_result(i64)
declare i64 @select_which(i64)
declare i64 @async_timeout(i64, i64)
declare i64 @timeout_result(i64)
declare i64 @timeout_expired(i64)
declare i64 @time_now_ms()
declare i64 @pin_new(i64, i64)
declare i64 @pin_new_uninit(i64)
declare i64 @pin_get(i64)
declare i64 @pin_get_mut(i64)
declare i64 @pin_is_pinned(i64)
declare void @pin_ref(i64)
declare void @pin_unref(i64)
declare void @pin_set_self_ref(i64, i64)
declare i64 @pin_check_self_ref(i64, i64)
declare i64 @intrinsic_call0(i64)
declare i64 @intrinsic_call1(i64, i64)
declare i64 @intrinsic_call2(i64, i64, i64)
declare i64 @intrinsic_call3(i64, i64, i64, i64)
declare i64 @scope_new()
declare i64 @scope_spawn(i64, i64)
declare i64 @scope_poll(i64)
declare i64 @scope_join(i64)
declare i64 @scope_get_result(i64, i64)
declare void @scope_cancel(i64)
declare i64 @scope_count(i64)
declare i64 @scope_completed(i64)
declare void @scope_free(i64)
declare i64 @nursery_run(i64, i64)
declare i64 @actor_get_status(i64)
declare i64 @actor_get_exit_reason(i64)
declare i64 @actor_get_error_code(i64)
declare void @actor_set_error(i64, i64, i64)
declare void @actor_stop(i64)
declare void @actor_kill(i64)
declare void @actor_crash(i64, i64, i64)
declare void @actor_set_on_error(i64, i64)
declare void @actor_set_on_exit(i64, i64)
declare void @actor_set_supervisor(i64, i64)
declare i64 @actor_get_supervisor(i64)
declare i64 @actor_get_restart_count(i64)
declare void @actor_increment_restart(i64)
declare i64 @actor_is_alive(i64)
declare i64 @circuit_breaker_new(i64, i64, i64)
declare i64 @circuit_breaker_allow(i64)
declare void @circuit_breaker_success(i64)
declare void @circuit_breaker_failure(i64)
declare i64 @circuit_breaker_state(i64)
declare void @circuit_breaker_reset(i64)
declare i64 @retry_policy_new(i64, i64, i64, i64)
declare void @retry_policy_set_jitter(i64, i64)
declare i64 @retry_policy_should_retry(i64)
declare i64 @retry_policy_next_delay(i64)
declare void @retry_policy_reset(i64)
declare i64 @retry_policy_count(i64)
declare i64 @actor_link(i64, i64)
declare void @actor_unlink(i64, i64)
declare i64 @actor_monitor(i64, i64)
declare void @actor_demonitor(i64)
declare void @actor_propagate_exit(i64, i64)
declare i64 @actor_is_linked(i64, i64)
declare i64 @actor_spawn_link(i64, i64, i64)
declare i64 @actor_get_links_count(i64)
declare i64 @actor_send_down(i64, i64, i64)
; Phase 23.1: Supervision Trees
declare i64 @supervisor_new(i64, i64, i64)
declare i64 @supervisor_add_child(i64, i64, i64, i64, i64)
declare i64 @supervisor_start(i64)
declare void @supervisor_stop(i64)
declare i64 @supervisor_handle_exit(i64, i64, i64)
declare i64 @supervisor_child_count(i64)
declare i64 @supervisor_child_status(i64, i64)
declare i64 @supervisor_child_handle(i64, i64)
declare void @supervisor_free(i64)
declare i64 @strategy_one_for_one()
declare i64 @strategy_one_for_all()
declare i64 @strategy_rest_for_one()
declare i64 @child_permanent()
declare i64 @child_temporary()
declare i64 @child_transient()
; Phase 23.2: Work-Stealing Scheduler
declare i64 @scheduler_new(i64)
declare i64 @scheduler_start(i64)
declare i64 @scheduler_submit(i64, i64, i64)
declare i64 @scheduler_submit_local(i64, i64, i64, i64)
declare void @scheduler_stop(i64)
declare void @scheduler_free(i64)
declare i64 @scheduler_worker_count(i64)
declare i64 @scheduler_queue_size(i64)
declare i64 @scheduler_worker_idle(i64, i64)
; Phase 23.3: Lock-Free Mailbox
declare i64 @mailbox_new(i64)
declare i64 @mailbox_send(i64, i64)
declare i64 @mailbox_ask(i64, i64)
declare i64 @mailbox_recv(i64)
declare i64 @mailbox_try_recv(i64)
declare i64 @mailbox_size(i64)
declare i64 @mailbox_empty(i64)
declare i64 @mailbox_full(i64)
declare void @mailbox_close(i64)
declare i64 @mailbox_is_closed(i64)
declare void @mailbox_free(i64)
; Phase 23.6: Actor Discovery and Registry
declare i64 @registry_register(i64, i64)
declare void @registry_unregister(i64)
declare i64 @registry_lookup(i64)
declare i64 @registry_count()
declare i64 @registry_set_metadata(i64, i64)
declare i64 @registry_get_metadata(i64)
; Phase 23.7: Backpressure and Flow Control
declare i64 @flow_controller_new(i64, i64, i64)
declare i64 @flow_check(i64)
declare i64 @flow_acquire(i64)
declare void @flow_release(i64)
declare i64 @flow_is_signaling(i64)
declare i64 @flow_current(i64)
declare i64 @flow_high_watermark(i64)
declare i64 @flow_low_watermark(i64)
declare void @flow_reset(i64)
declare void @flow_free(i64)
declare i64 @flow_mode_drop()
declare i64 @flow_mode_block()
declare i64 @flow_mode_signal()
declare void @intrinsic_exit(i64)
; Phase 1 Stdlib: Option
declare i64 @"option_some"(i64)
declare i64 @"option_none"()
declare i64 @"option_is_some"(i64)
declare i64 @"option_is_none"(i64)
declare i64 @"option_unwrap"(i64)
declare i64 @"option_expect"(i64, i64)
declare i64 @"option_unwrap_or"(i64, i64)
declare i64 @"option_map"(i64, i64)
; Phase 1 Stdlib: Result
declare i64 @"result_ok"(i64)
declare i64 @"result_err"(i64)
declare i64 @"result_is_ok"(i64)
declare i64 @"result_is_err"(i64)
declare i64 @"result_unwrap"(i64)
declare i64 @"result_unwrap_err"(i64)
declare i64 @"result_unwrap_or"(i64, i64)
declare i64 @"result_ok_or"(i64, i64)
; Phase 1 Stdlib: Vec extensions
declare i64 @"vec_sum"(i64)
declare i64 @"vec_find"(i64, i64)
declare i64 @"vec_contains"(i64, i64)
declare i64 @"vec_reverse"(i64)
declare i64 @"vec_clone"(i64)
declare i64 @"vec_first"(i64)
declare i64 @"vec_last"(i64)
declare i64 @"vec_pop"(i64)
declare i64 @"vec_set"(i64, i64, i64)
declare i64 @"vec_clear"(i64)
declare i64 @"vec_remove"(i64, i64)
; Phase 1 Stdlib: HashMap
declare i64 @"hashmap_new"()
declare i64 @"hashmap_insert"(i64, i64, i64)
declare i64 @"hashmap_get"(i64, i64)
declare i64 @"hashmap_remove"(i64, i64)
declare i64 @"hashmap_contains"(i64, i64)
declare i64 @"hashmap_len"(i64)
declare i64 @"hashmap_clear"(i64)
declare i64 @"hashmap_keys"(i64)
declare i64 @"hashmap_values"(i64)
; Phase 1 Stdlib: HashSet
declare i64 @"hashset_new"()
declare i64 @"hashset_insert"(i64, i64)
declare i64 @"hashset_remove"(i64, i64)
declare i64 @"hashset_contains"(i64, i64)
declare i64 @"hashset_len"(i64)
declare i64 @"hashset_clear"(i64)
; Phase 1 Stdlib: JSON
declare i64 @"json_parse_simple"(i64)
declare i64 @"json_stringify"(i64)
declare i64 @"json_get_sx"(i64, i64)
declare i64 @"json_keys"(i64)
declare i64 @"json_is_string"(i64)
declare i64 @"json_is_object"(i64)
declare i64 @"json_is_array"(i64)
declare i64 @"json_as_string"(i64)
declare i64 @"json_as_array"(i64)
declare i64 @"json_object_new"()
declare i64 @"json_array_new"()
declare i64 @"json_object_set"(i64, i64, i64)
declare i64 @"json_array_push"(i64, i64)
declare i64 @"json_string"(i64)
declare i64 @"json_string_sx"(i64)
declare i64 @"json_array_len"(i64)
declare i64 @"json_object_len"(i64)
declare i64 @"json_as_i64"(i64)
declare i64 @"json_get_index"(i64, i64)
declare i64 @"json_is_null"(i64)
declare i64 @"json_object_key_at"(i64, i64)
declare i64 @"json_object_value_at"(i64, i64)
declare i64 @"json_object_set_sx"(i64, i64, i64)
; Phase 3: HTTP Client/Server
declare i64 @"http_request_new"(i64, i64)
declare i64 @"http_request_header"(i64, i64, i64)
declare i64 @"http_request_body"(i64, i64)
declare i64 @"http_request_send"(i64)
declare i64 @"http_request_free"(i64)
declare i64 @"http_response_status"(i64)
declare i64 @"http_response_body"(i64)
declare i64 @"http_response_header"(i64, i64)
declare i64 @"http_response_free"(i64)
declare i64 @"http_server_new"(i64)
declare i64 @"http_server_route"(i64, i64, i64, i64)
declare i64 @"http_server_start"(i64)
declare i64 @"http_server_stop"(i64)
declare i64 @"http_server_free"(i64)
; Phase 3: SQL Database
declare i64 @"sql_open"(i64)
declare void @"sql_close"(i64)
declare i64 @"sql_exec"(i64, i64)
declare i64 @"sql_query"(i64, i64)
declare i64 @"sql_prepare"(i64, i64)
declare i64 @"sql_bind_int"(i64, i64, i64)
declare i64 @"sql_bind_text"(i64, i64, i64)
declare i64 @"sql_bind_float"(i64, i64, double)
declare i64 @"sql_bind_null"(i64, i64)
declare i64 @"sql_bind_blob"(i64, i64, i64, i64)
declare i64 @"sql_step"(i64)
declare i64 @"sql_column_int"(i64, i64)
declare i64 @"sql_column_text"(i64, i64)
declare double @"sql_column_float"(i64, i64)
declare i64 @"sql_column_blob"(i64, i64)
declare i64 @"sql_column_blob_len"(i64, i64)
declare i64 @"sql_column_is_null"(i64, i64)
declare void @"sql_finalize"(i64)
declare i64 @"sql_begin"(i64)
declare i64 @"sql_commit"(i64)
declare i64 @"sql_rollback"(i64)
declare i64 @"sql_last_insert_id"(i64)
; Phase 3: UUID
declare i64 @"uuid_v4"()
declare i64 @"uuid_nil"()
declare i64 @"uuid_is_nil"(i64)
declare i64 @"uuid_is_valid"(i64)
; Phase 3: TOML
declare i64 @"toml_parse"(i64)
declare i64 @"toml_get"(i64, i64)
declare i64 @"toml_get_string"(i64, i64)
declare i64 @"toml_get_int"(i64, i64)
declare double @"toml_get_float"(i64, i64)
declare i64 @"toml_get_bool"(i64, i64)
declare i64 @"toml_get_array"(i64, i64)
declare i64 @"toml_get_table"(i64, i64)
declare i64 @"toml_set_string"(i64, i64, i64)
declare i64 @"toml_set_int"(i64, i64, i64)
declare i64 @"toml_set_float"(i64, i64, double)
declare i64 @"toml_set_bool"(i64, i64, i64)
declare i64 @"toml_stringify"(i64)
declare i64 @"toml_table_new"()
declare i64 @"toml_free"(i64)
; Phase G: AI Features
declare i64 @model_infer(i64)
declare i64 @model_load(i64)
declare i64 @model_embed(i64, i64)
declare i64 @model_classify(i64, i64)
declare void @model_unload(i64)
; AI Vector Operations
declare i64 @vector_new(i64, i64)
declare i64 @vector_len(i64)
declare double @vector_get(i64, i64)
declare void @vector_set(i64, i64, double)
declare double @vector_dot(i64, i64)
declare i64 @vector_add(i64, i64)
declare i64 @vector_sub(i64, i64)
declare i64 @vector_scale(i64, double)
declare double @vector_norm(i64)
declare i64 @vector_normalize(i64)
declare double @vector_cosine_similarity(i64, i64)
; AI Tensor Operations
declare i64 @tensor_new(i64, i64)
declare i64 @tensor_shape(i64)
declare i64 @tensor_rank(i64)
declare double @tensor_get(i64, i64)
declare void @tensor_set(i64, i64, double)
declare i64 @tensor_matmul(i64, i64)
declare i64 @tensor_add(i64, i64)
declare i64 @tensor_transpose(i64)
declare i64 @tensor_reshape(i64, i64)
; Specialist Operations
declare i64 @specialist_query(i64, i64)
declare i64 @specialist_stream(i64, i64)
declare void @specialist_set_context(i64, i64)
declare i64 @specialist_get_context(i64)
; Hive Operations
declare i64 @hive_route(i64, i64)
declare void @hive_add_specialist(i64, i64)
declare void @hive_remove_specialist(i64, i64)
declare i64 @hive_consensus(i64, i64)
declare i64 @"sx_int_to_f64"(i64)
declare i64 @"sx_f64_to_int"(i64)
declare i64 @"sx_f64_add"(i64, i64)
declare i64 @"sx_f64_sub"(i64, i64)
declare i64 @"sx_f64_mul"(i64, i64)
declare i64 @"sx_f64_div"(i64, i64)
declare i64 @"sx_f64_mod"(i64, i64)
declare i64 @"sx_f64_gt"(i64, i64)
declare i64 @"sx_f64_lt"(i64, i64)
declare i64 @"sx_f64_ge"(i64, i64)
declare i64 @"sx_f64_le"(i64, i64)
declare i64 @"sx_f64_eq"(i64, i64)
declare i64 @"sx_f64_ne"(i64, i64)
declare i64 @"f64_neg"(i64)
declare i64 @"json_parse"(i64)
declare i64 @"json_get"(i64, i64)
declare i64 @"json_set"(i64, i64, i64)
declare i64 @"string_from"(i64)
declare i64 @"infer"(i64, i64)
declare i64 @"path_exists"(i64)
declare i64 @"tanh_f64"(i64)
declare i64 @"contract_result_violation_type"(i64)
declare i64 @"activation_record"(i64, i64)
declare i64 @"neural_reset_pruning"()
declare i64 @"device_type"(i64)
declare i64 @"lazy_branch_count"(i64)
declare i64 @"lazy_context_new"()
declare i64 @"lazy_context_free"(i64)
declare i64 @"lazy_dominant_branch"(i64)
declare i64 @"lazy_executed_count"(i64)
declare i64 @"lazy_mark_executed"(i64, i64)
declare i64 @"lazy_should_execute"(i64, i64)
declare i64 @"activation_tracker_init"()
declare i64 @"activation_tracking_enabled"()
declare i64 @"neural_gate_new"(i64, i64, i64, i64)
declare i64 @"neural_gate_with_contract"(i64, i64, i64, i64, i64)
declare i64 @"neural_gate_execute_on_device"(i64, i64, i64)
declare i64 @"gate_bind_device"(i64, i64)
declare i64 @"gate_get_device"(i64)
declare i64 @"gate_has_explicit_binding"(i64)
declare i64 @"dead_path_analyzer_new"()
declare i64 @"dead_path_analyzer_free"(i64)
declare i64 @"dead_path_add_edge"(i64, i64, i64)
declare i64 @"dead_path_mark_entry"(i64, i64)
declare i64 @"dead_path_propagate"(i64)
declare i64 @"dead_path_reachable_count"(i64)
declare i64 @"graph_new"()
declare i64 @"graph_free"(i64)
declare i64 @"graph_add_node"(i64, i64)
declare i64 @"graph_add_edge"(i64, i64, i64)
declare i64 @"graph_partition"(i64, i64)
declare i64 @"graph_partition_count"(i64)
declare i64 @"graph_partition_device"(i64, i64)
declare i64 @"pruning_context_new"()
declare i64 @"pruning_context_free"(i64)
declare i64 @"pruning_add_gate"(i64, i64, i64)
declare i64 @"pruning_execute"(i64)
declare i64 @"pruning_is_pruned"(i64, i64)
declare i64 @"pruning_ratio"(i64)
declare i64 @"pruning_reason"(i64, i64)
declare i64 @"pruning_total_count"(i64)
declare i64 @"structured_pruner_new"()
declare i64 @"structured_pruner_free"(i64)
declare i64 @"speculative_context_new"()
declare i64 @"speculative_context_free"(i64)
declare i64 @"speculative_add_branch"(i64, i64, i64)
declare i64 @"speculative_get_result"(i64, i64)
declare i64 @"speculative_set_result"(i64, i64, i64)
declare i64 @"speculative_weighted_result"(i64)
declare i64 @"speculative_memory_used"(i64)
declare i64 @"speculative_gc"(i64)
declare i64 @"optimization_stats_calculate"(i64, i64)
declare i64 @"optimization_stats_free"(i64)
declare i64 @"optimization_speedup"(i64)
declare i64 @"optimization_size_reduction"(i64)
declare i64 @"dual_variable"(i64)
declare i64 @"dual_constant"(i64)
declare i64 @"dual_add"(i64, i64)
declare i64 @"dual_mul"(i64, i64)
declare i64 @"dual_div"(i64, i64)
declare i64 @"dual_mul_scalar"(i64, i64)
declare i64 @"dual_sin"(i64)
declare i64 @"dual_cos"(i64)
declare i64 @"dual_exp"(i64)
declare i64 @"dual_ln"(i64)
declare i64 @"dual_sqrt"(i64)
declare i64 @"dual_tanh"(i64)
declare i64 @"dual_sigmoid"(i64)
declare i64 @"dual_powi"(i64, i64)
declare i64 @"int_hashset_new"()
declare i64 @"int_hashset_insert"(i64, i64)
declare i64 @"int_hashset_contains"(i64, i64)
declare i64 @"int_hashset_len"(i64)
declare i64 @"not_approx_eq"(i64, i64, i64)
declare i64 @"transfer_queue_init"(i64)
declare i64 @"sxiter_from_vec"(i64)
declare i64 @"sxiter_collect_vec"(i64)
declare i64 @"sxiter_filter"(i64, i64)
declare i64 @"wref_registry_init"()
declare i64 @"wref_new"(i64, i64, i64)
declare i64 @"wref_ptr"(i64)
declare i64 @"wref_weight"(i64)
declare i64 @"wref_count"()
declare i64 @"wref_state"(i64)
declare i64 @"wref_retain"(i64)
declare i64 @"wref_release"(i64)
declare i64 @"wref_is_allocated"(i64)
declare i64 @"wref_collapse"(i64)
declare i64 @"wref_set_weight"(i64, i64)
declare i64 @"wref_set_mode"(i64)
declare i64 @"wref_get_mode"()
declare i64 @"wref_set_weight_threshold"(i64)
declare i64 @"wref_get_weight_threshold"()
declare i64 @"wref_gc"()
declare i64 @"wref_gc_total_runs"()
declare i64 @"wref_gc_total_collected"()
declare i64 @"wref_gc_last_collected"()
declare i64 @"wref_bytes_allocated"()
declare i64 @"device_registry_init"()
declare i64 @"contract_violation_count"()
declare i64 @"contract_set_violation_handler"(i64)
declare i64 @"neural_gate_weight"(i64)
declare i64 @"lazy_eval"(i64)
declare i64 @"lazy_best_branch"(i64)
declare i64 @"print_f64"(i64)
declare i64 @"device_register"(i64, i64, i64, i64, i64, i64)
declare i64 @"lazy_add_branch"(i64, i64)
declare i64 @"contract_result_satisfied"(i64)
declare i64 @"neural_set_temperature"(i64)
declare i64 @"activation_rate_get"(i64)
declare i64 @"neural_register_gate_weight"(i64, i64, i64)
declare i64 @"ckpt_context_fork"(i64)
declare i64 @"ckpt_context_merge"(i64, i64)
declare i64 @"sqrt_f64"(i64)
declare i64 @"ckpt_save"(i64)
declare i64 @"contract_result_ok"()
declare i64 @"neural_get_temperature"()
declare i64 @"activation_mean_get"(i64)
declare i64 @"neural_prune_by_weight_magnitude"(i64)
declare i64 @"activation_gate_count"()
declare i64 @"ckpt_restore"(i64)
declare i64 @"contract_result_new"(i64, i64)
declare i64 @"contract_result_free"(i64)
declare i64 @"device_get_default"()
declare i64 @"grad_tape_temperature"(i64)
declare i64 @"json_object_has"(i64, i64)
declare i64 @"neural_is_gate_pruned"(i64)
declare i64 @"ln_f64"(i64)
declare i64 @"device_get"(i64)
declare i64 @"ckpt_count"()
declare i64 @"contract_in_range"(i64, i64, i64)
declare i64 @"grad_tape_set_training"(i64, i64)
declare i64 @"activation_epoch_current"()
declare i64 @"neural_get_pruned_gate_count"()
declare i64 @"exp_f64"(i64)
declare i64 @"sin_f64"(i64)
declare i64 @"json_is_number"(i64)
declare i64 @"string_to_lowercase"(i64)
declare i64 @"string_split_whitespace"(i64)
declare i64 @"device_count"()
declare i64 @"ckpt_context_new"()
declare i64 @"ckpt_context_free"(i64)
declare i64 @"ckpt_context_save"(i64)
declare i64 @"ckpt_context_restore"(i64)
declare i64 @"contract_get_panic_mode"()
declare i64 @"contract_set_panic_mode"(i64)
declare i64 @"grad_tape_set_temperature"(i64, i64)
declare i64 @"activation_epoch_advance"(i64)
declare i64 @"neural_get_gate_count"()
declare i64 @"json_is_bool"(i64)
; v0.13.0 Runtime
declare i64 @"print_string"(i64)
declare i64 @"file_delete"(i64)
declare i64 @"cos_f64"(i64)
declare i64 @"pow_f64"(i64, i64)
declare i64 @"neural_set_training_mode"(i64)
declare i64 @"neural_get_training_mode"()
declare i64 @"neural_sigmoid"(i64)
declare i64 @"neural_register_gate"(i64)
declare i64 @"neural_clear_gate_registry"()
declare i64 @"neural_gate_count"()
declare i64 @"grad_tape_new"()
declare i64 @"grad_tape_free"(i64)
declare i64 @"grad_tape_len"(i64)
declare i64 @"grad_tape_record"(i64, i64)
declare i64 @"contract_check_requires"(i64, i64, i64)
declare i64 @"contract_check_ensures"(i64, i64, i64)
declare i64 @"contract_check_invariant"(i64, i64, i64)
declare i64 @"device_available"(i64)
declare i64 @"activation_count_inc"(i64)
declare i64 @"activation_count_get"(i64)
declare i64 @"ckpt_branch_start"()
declare i64 @"ckpt_branch_end"(i64)
declare i64 @"anneal_exponential"(i64, i64)
declare i64 @"anneal_linear"(i64, i64)
declare i64 @"json_null"()
declare i64 @"json_bool"(i64)
declare i64 @"json_number_i64"(i64)
declare i64 @"json_number_f64"(i64)
declare i64 @"json_array"()
declare i64 @"json_object"()
declare i64 @"json_as_bool"(i64)
declare i64 @"HashMap_new"()
declare i64 @"hashmap_is_empty"(i64)
declare i64 @"timer_start"()
declare i64 @"timer_elapsed_us"(i64)
declare i64 @"timer_elapsed_ms"(i64)
declare i64 @"timer_elapsed_s"(i64)
declare i64 @"timer_close"(i64)
declare i64 @"timer_record_to"(i64, i64)
declare i64 @"logger_new"()
declare i64 @"logger_global"()
declare i64 @"logger_set_level"(i64, i64)
declare i64 @"logger_set_console"(i64, i64)
declare i64 @"logger_set_file"(i64, i64)
declare i64 @"logger_set_json"(i64, i64)
declare i64 @"logger_add_context"(i64, i64, i64)
declare i64 @"logger_close"(i64)
declare i64 @"log_debug"(i64)
declare i64 @"log_info"(i64)
declare i64 @"log_warn"(i64)
declare i64 @"log_error"(i64)
declare i64 @"log_fatal"(i64)
declare i64 @"log_with_field"(i64, i64, i64)
declare i64 @"log_with_span"(i64, i64)
declare i64 @"counter_new"(i64)
declare i64 @"counter_inc"(i64)
declare i64 @"counter_add"(i64, i64)
declare i64 @"counter_add_label"(i64, i64, i64)
declare i64 @"counter_value"(i64)
declare i64 @"gauge_new"(i64)
declare i64 @"gauge_set"(i64, i64)
declare i64 @"gauge_inc"(i64)
declare i64 @"gauge_dec"(i64)
declare i64 @"gauge_add"(i64, i64)
declare i64 @"gauge_value"(i64)
declare i64 @"histogram_new"(i64)
declare i64 @"histogram_observe"(i64, i64)
declare i64 @"histogram_count"(i64)
declare i64 @"histogram_sum"(i64)
declare i64 @"histogram_mean"(i64)
declare i64 @"histogram_min"(i64)
declare i64 @"histogram_max"(i64)
declare i64 @"histogram_to_json"(i64)
declare i64 @"metrics_registry_new"()
declare i64 @"metrics_registry_global"()
declare i64 @"metrics_registry_count"(i64)
declare i64 @"metrics_registry_close"(i64)
declare i64 @"metrics_export_json"(i64)
declare i64 @"metrics_export_prometheus"(i64)
declare i64 @"span_start"(i64)
declare i64 @"span_start_child"(i64, i64)
declare i64 @"span_end"(i64)
declare i64 @"span_close"(i64)
declare i64 @"span_id"(i64)
declare i64 @"span_trace_id"(i64)
declare i64 @"span_duration_us"(i64)
declare i64 @"span_set_attribute"(i64, i64, i64)
declare i64 @"span_set_status"(i64, i64)
declare i64 @"span_add_event"(i64, i64)
declare i64 @"span_to_json"(i64)
declare i64 @"tracer_new"()
declare i64 @"tracer_active_spans"(i64)
declare i64 @"tracer_close"(i64)

define i64 @"abs_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t0 = load i64, ptr %local.x
  %t1 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"my_sqrt"(i64 %x) nounwind {
entry:
  %local.g.9 = alloca i64
  %local.i.10 = alloca i64
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t11 = load i64, ptr %local.x
  %t12 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.2)
  %t13 = call i64 @"sx_f64_le"(i64 %t11, i64 %t12)
  %t14 = icmp ne i64 %t13, 0
  br i1 %t14, label %then1, label %else1
then1:
  %t15 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.3)
  ret i64 %t15
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t16 = phi i64 [ 0, %else1_end ]
  %t17 = load i64, ptr %local.x
  store i64 %t17, ptr %local.g.9
  store i64 0, ptr %local.i.10
  br label %loop2
loop2:
  %t18 = load i64, ptr %local.i.10
  %t19 = icmp slt i64 %t18, 30
  %t20 = zext i1 %t19 to i64
  %t21 = icmp ne i64 %t20, 0
  br i1 %t21, label %body2, label %endloop2
body2:
  %t22 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.4)
  %t23 = load i64, ptr %local.g.9
  %t24 = load i64, ptr %local.x
  %t25 = load i64, ptr %local.g.9
  %t26 = call i64 @"sx_f64_div"(i64 %t24, i64 %t25)
  %t27 = call i64 @"sx_f64_add"(i64 %t23, i64 %t26)
  %t28 = call i64 @"sx_f64_mul"(i64 %t22, i64 %t27)
  store i64 %t28, ptr %local.g.9
  %t29 = load i64, ptr %local.i.10
  %t30 = add i64 %t29, 1
  store i64 %t30, ptr %local.i.10
  br label %loop2
endloop2:
  %t31 = load i64, ptr %local.g.9
  ret i64 %t31
}

define i64 @"ksq"(i64 %kx, i64 %ky, i64 %kz) nounwind {
entry:
  %local.fx.32 = alloca i64
  %local.fy.33 = alloca i64
  %local.fz.34 = alloca i64
  %local.kx = alloca i64
  store i64 %kx, ptr %local.kx
  %local.ky = alloca i64
  store i64 %ky, ptr %local.ky
  %local.kz = alloca i64
  store i64 %kz, ptr %local.kz
  %t35 = load i64, ptr %local.kx
  %t36 = call i64 @"sx_int_to_f64"(i64 %t35)
  store i64 %t36, ptr %local.fx.32
  %t37 = load i64, ptr %local.ky
  %t38 = call i64 @"sx_int_to_f64"(i64 %t37)
  store i64 %t38, ptr %local.fy.33
  %t39 = load i64, ptr %local.kz
  %t40 = call i64 @"sx_int_to_f64"(i64 %t39)
  store i64 %t40, ptr %local.fz.34
  %t41 = load i64, ptr %local.fx.32
  %t42 = load i64, ptr %local.fx.32
  %t43 = call i64 @"sx_f64_mul"(i64 %t41, i64 %t42)
  %t44 = load i64, ptr %local.fy.33
  %t45 = load i64, ptr %local.fy.33
  %t46 = call i64 @"sx_f64_mul"(i64 %t44, i64 %t45)
  %t47 = call i64 @"sx_f64_add"(i64 %t43, i64 %t46)
  %t48 = load i64, ptr %local.fz.34
  %t49 = load i64, ptr %local.fz.34
  %t50 = call i64 @"sx_f64_mul"(i64 %t48, i64 %t49)
  %t51 = call i64 @"sx_f64_add"(i64 %t47, i64 %t50)
  ret i64 %t51
}

define i64 @"dot3"(i64 %ax, i64 %ay, i64 %az, i64 %bx, i64 %by, i64 %bz) nounwind {
entry:
  %local.ax = alloca i64
  store i64 %ax, ptr %local.ax
  %local.ay = alloca i64
  store i64 %ay, ptr %local.ay
  %local.az = alloca i64
  store i64 %az, ptr %local.az
  %local.bx = alloca i64
  store i64 %bx, ptr %local.bx
  %local.by = alloca i64
  store i64 %by, ptr %local.by
  %local.bz = alloca i64
  store i64 %bz, ptr %local.bz
  %t52 = load i64, ptr %local.ax
  %t53 = load i64, ptr %local.bx
  %t54 = mul i64 %t52, %t53
  %t55 = load i64, ptr %local.ay
  %t56 = load i64, ptr %local.by
  %t57 = mul i64 %t55, %t56
  %t58 = add i64 %t54, %t57
  %t59 = load i64, ptr %local.az
  %t60 = load i64, ptr %local.bz
  %t61 = mul i64 %t59, %t60
  %t62 = add i64 %t58, %t61
  %t63 = call i64 @"sx_int_to_f64"(i64 %t62)
  ret i64 %t63
}

define i64 @"spectrum_bound"(i64 %k2, i64 %omega_max) nounwind {
entry:
  %local.bound.64 = alloca i64
  %local.k2 = alloca i64
  store i64 %k2, ptr %local.k2
  %local.omega_max = alloca i64
  store i64 %omega_max, ptr %local.omega_max
  %t65 = load i64, ptr %local.k2
  %t66 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.5)
  %t67 = call i64 @"sx_f64_lt"(i64 %t65, i64 %t66)
  %t68 = icmp ne i64 %t67, 0
  br i1 %t68, label %then3, label %else3
then3:
  %t69 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.6)
  ret i64 %t69
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t70 = phi i64 [ 0, %else3_end ]
  %t71 = load i64, ptr %local.omega_max
  %t72 = load i64, ptr %local.k2
  %t73 = call i64 @"sx_f64_div"(i64 %t71, i64 %t72)
  store i64 %t73, ptr %local.bound.64
  %t74 = load i64, ptr %local.bound.64
  %t75 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.7)
  %t76 = call i64 @"sx_f64_lt"(i64 %t74, i64 %t75)
  %t77 = icmp ne i64 %t76, 0
  br i1 %t77, label %then4, label %else4
then4:
  %t78 = load i64, ptr %local.bound.64
  br label %then4_end
then4_end:
  br label %endif4
else4:
  %t79 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.8)
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t80 = phi i64 [ %t78, %then4_end ], [ %t79, %else4_end ]
  ret i64 %t80
}

define i64 @"net_transfer_bounded"(i64 %kx, i64 %ky, i64 %kz, i64 %n_max, i64 %omega_max) nounwind {
entry:
  %local.nf.81 = alloca i64
  %local.k2.82 = alloca i64
  %local.s_in.83 = alloca i64
  %local.s_out.84 = alloca i64
  %local.px.85 = alloca i64
  %local.py.86 = alloca i64
  %local.pz.87 = alloca i64
  %local.p2.88 = alloca i64
  %local.qx.89 = alloca i64
  %local.qy.90 = alloca i64
  %local.qz.91 = alloca i64
  %local.q2.92 = alloca i64
  %local.u_p_sq.93 = alloca i64
  %local.qk.94 = alloca i64
  %local.sin2.95 = alloca i64
  %local.cos2.96 = alloca i64
  %local.u_k_sq.97 = alloca i64
  %local.qx.98 = alloca i64
  %local.qy.99 = alloca i64
  %local.qz.100 = alloca i64
  %local.q2.101 = alloca i64
  %local.target_x.102 = alloca i64
  %local.target_y.103 = alloca i64
  %local.target_z.104 = alloca i64
  %local.p2.105 = alloca i64
  %local.qp.106 = alloca i64
  %local.sin2.107 = alloca i64
  %local.cos2.108 = alloca i64
  %local.kx = alloca i64
  store i64 %kx, ptr %local.kx
  %local.ky = alloca i64
  store i64 %ky, ptr %local.ky
  %local.kz = alloca i64
  store i64 %kz, ptr %local.kz
  %local.n_max = alloca i64
  store i64 %n_max, ptr %local.n_max
  %local.omega_max = alloca i64
  store i64 %omega_max, ptr %local.omega_max
  %t109 = load i64, ptr %local.n_max
  %t110 = call i64 @"sx_int_to_f64"(i64 %t109)
  store i64 %t110, ptr %local.nf.81
  %t111 = load i64, ptr %local.kx
  %t112 = load i64, ptr %local.ky
  %t113 = load i64, ptr %local.kz
  %t114 = call i64 @"ksq"(i64 %t111, i64 %t112, i64 %t113)
  store i64 %t114, ptr %local.k2.82
  %t115 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.9)
  store i64 %t115, ptr %local.s_in.83
  %t116 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.10)
  store i64 %t116, ptr %local.s_out.84
  %t117 = load i64, ptr %local.n_max
  %t118 = sub i64 0, %t117
  store i64 %t118, ptr %local.px.85
  br label %loop5
loop5:
  %t119 = load i64, ptr %local.px.85
  %t120 = load i64, ptr %local.n_max
  %t121 = icmp sle i64 %t119, %t120
  %t122 = zext i1 %t121 to i64
  %t123 = icmp ne i64 %t122, 0
  br i1 %t123, label %body5, label %endloop5
body5:
  %t124 = load i64, ptr %local.n_max
  %t125 = sub i64 0, %t124
  store i64 %t125, ptr %local.py.86
  br label %loop6
loop6:
  %t126 = load i64, ptr %local.py.86
  %t127 = load i64, ptr %local.n_max
  %t128 = icmp sle i64 %t126, %t127
  %t129 = zext i1 %t128 to i64
  %t130 = icmp ne i64 %t129, 0
  br i1 %t130, label %body6, label %endloop6
body6:
  %t131 = load i64, ptr %local.n_max
  %t132 = sub i64 0, %t131
  store i64 %t132, ptr %local.pz.87
  br label %loop7
loop7:
  %t133 = load i64, ptr %local.pz.87
  %t134 = load i64, ptr %local.n_max
  %t135 = icmp sle i64 %t133, %t134
  %t136 = zext i1 %t135 to i64
  %t137 = icmp ne i64 %t136, 0
  br i1 %t137, label %body7, label %endloop7
body7:
  %t138 = load i64, ptr %local.px.85
  %t139 = load i64, ptr %local.py.86
  %t140 = load i64, ptr %local.pz.87
  %t141 = call i64 @"ksq"(i64 %t138, i64 %t139, i64 %t140)
  store i64 %t141, ptr %local.p2.88
  %t142 = load i64, ptr %local.p2.88
  %t143 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.11)
  %t144 = call i64 @"sx_f64_gt"(i64 %t142, i64 %t143)
  %t145 = icmp ne i64 %t144, 0
  br i1 %t145, label %then8, label %else8
then8:
  %t146 = load i64, ptr %local.kx
  %t147 = load i64, ptr %local.px.85
  %t148 = sub i64 %t146, %t147
  store i64 %t148, ptr %local.qx.89
  %t149 = load i64, ptr %local.ky
  %t150 = load i64, ptr %local.py.86
  %t151 = sub i64 %t149, %t150
  store i64 %t151, ptr %local.qy.90
  %t152 = load i64, ptr %local.kz
  %t153 = load i64, ptr %local.pz.87
  %t154 = sub i64 %t152, %t153
  store i64 %t154, ptr %local.qz.91
  %t155 = load i64, ptr %local.qx.89
  %t156 = load i64, ptr %local.qy.90
  %t157 = load i64, ptr %local.qz.91
  %t158 = call i64 @"ksq"(i64 %t155, i64 %t156, i64 %t157)
  store i64 %t158, ptr %local.q2.92
  %t159 = load i64, ptr %local.q2.92
  %t160 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.12)
  %t161 = call i64 @"sx_f64_gt"(i64 %t159, i64 %t160)
  %t162 = icmp ne i64 %t161, 0
  br i1 %t162, label %then9, label %else9
then9:
  %t163 = load i64, ptr %local.q2.92
  %t164 = load i64, ptr %local.nf.81
  %t165 = load i64, ptr %local.nf.81
  %t166 = call i64 @"sx_f64_mul"(i64 %t164, i64 %t165)
  %t167 = call i64 @"sx_f64_le"(i64 %t163, i64 %t166)
  %t168 = icmp ne i64 %t167, 0
  br i1 %t168, label %then10, label %else10
then10:
  %t169 = load i64, ptr %local.p2.88
  %t170 = load i64, ptr %local.omega_max
  %t171 = call i64 @"spectrum_bound"(i64 %t169, i64 %t170)
  store i64 %t171, ptr %local.u_p_sq.93
  %t172 = load i64, ptr %local.qx.89
  %t173 = load i64, ptr %local.qy.90
  %t174 = load i64, ptr %local.qz.91
  %t175 = load i64, ptr %local.kx
  %t176 = load i64, ptr %local.ky
  %t177 = load i64, ptr %local.kz
  %t178 = call i64 @"dot3"(i64 %t172, i64 %t173, i64 %t174, i64 %t175, i64 %t176, i64 %t177)
  store i64 %t178, ptr %local.qk.94
  %t179 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.13)
  store i64 %t179, ptr %local.sin2.95
  %t180 = load i64, ptr %local.q2.92
  %t181 = load i64, ptr %local.k2.82
  %t182 = call i64 @"sx_f64_mul"(i64 %t180, i64 %t181)
  %t183 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.14)
  %t184 = call i64 @"sx_f64_gt"(i64 %t182, i64 %t183)
  %t185 = icmp ne i64 %t184, 0
  br i1 %t185, label %then11, label %else11
then11:
  %t186 = load i64, ptr %local.qk.94
  %t187 = load i64, ptr %local.qk.94
  %t188 = call i64 @"sx_f64_mul"(i64 %t186, i64 %t187)
  %t189 = load i64, ptr %local.q2.92
  %t190 = load i64, ptr %local.k2.82
  %t191 = call i64 @"sx_f64_mul"(i64 %t189, i64 %t190)
  %t192 = call i64 @"sx_f64_div"(i64 %t188, i64 %t191)
  store i64 %t192, ptr %local.cos2.96
  %t193 = load i64, ptr %local.cos2.96
  %t194 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.15)
  %t195 = call i64 @"sx_f64_lt"(i64 %t193, i64 %t194)
  %t196 = icmp ne i64 %t195, 0
  br i1 %t196, label %then12, label %else12
then12:
  %t197 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.16)
  %t198 = load i64, ptr %local.cos2.96
  %t199 = call i64 @"sx_f64_sub"(i64 %t197, i64 %t198)
  store i64 %t199, ptr %local.sin2.95
  br label %then12_end
then12_end:
  br label %endif12
else12:
  %t200 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.17)
  store i64 %t200, ptr %local.sin2.95
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t201 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t202 = phi i64 [ %t201, %then11_end ], [ 0, %else11_end ]
  %t203 = load i64, ptr %local.s_in.83
  %t204 = load i64, ptr %local.q2.92
  %t205 = load i64, ptr %local.u_p_sq.93
  %t206 = call i64 @"sx_f64_mul"(i64 %t204, i64 %t205)
  %t207 = load i64, ptr %local.sin2.95
  %t208 = call i64 @"sx_f64_mul"(i64 %t206, i64 %t207)
  %t209 = call i64 @"sx_f64_add"(i64 %t203, i64 %t208)
  store i64 %t209, ptr %local.s_in.83
  br label %then10_end
then10_end:
  br label %endif10
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t210 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t211 = phi i64 [ %t210, %then9_end ], [ 0, %else9_end ]
  br label %then8_end
then8_end:
  br label %endif8
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t212 = phi i64 [ %t211, %then8_end ], [ 0, %else8_end ]
  %t213 = load i64, ptr %local.pz.87
  %t214 = add i64 %t213, 1
  store i64 %t214, ptr %local.pz.87
  br label %loop7
endloop7:
  %t215 = load i64, ptr %local.py.86
  %t216 = add i64 %t215, 1
  store i64 %t216, ptr %local.py.86
  br label %loop6
endloop6:
  %t217 = load i64, ptr %local.px.85
  %t218 = add i64 %t217, 1
  store i64 %t218, ptr %local.px.85
  br label %loop5
endloop5:
  %t219 = load i64, ptr %local.k2.82
  %t220 = load i64, ptr %local.omega_max
  %t221 = call i64 @"spectrum_bound"(i64 %t219, i64 %t220)
  store i64 %t221, ptr %local.u_k_sq.97
  %t222 = load i64, ptr %local.n_max
  %t223 = sub i64 0, %t222
  store i64 %t223, ptr %local.qx.98
  br label %loop13
loop13:
  %t224 = load i64, ptr %local.qx.98
  %t225 = load i64, ptr %local.n_max
  %t226 = icmp sle i64 %t224, %t225
  %t227 = zext i1 %t226 to i64
  %t228 = icmp ne i64 %t227, 0
  br i1 %t228, label %body13, label %endloop13
body13:
  %t229 = load i64, ptr %local.n_max
  %t230 = sub i64 0, %t229
  store i64 %t230, ptr %local.qy.99
  br label %loop14
loop14:
  %t231 = load i64, ptr %local.qy.99
  %t232 = load i64, ptr %local.n_max
  %t233 = icmp sle i64 %t231, %t232
  %t234 = zext i1 %t233 to i64
  %t235 = icmp ne i64 %t234, 0
  br i1 %t235, label %body14, label %endloop14
body14:
  %t236 = load i64, ptr %local.n_max
  %t237 = sub i64 0, %t236
  store i64 %t237, ptr %local.qz.100
  br label %loop15
loop15:
  %t238 = load i64, ptr %local.qz.100
  %t239 = load i64, ptr %local.n_max
  %t240 = icmp sle i64 %t238, %t239
  %t241 = zext i1 %t240 to i64
  %t242 = icmp ne i64 %t241, 0
  br i1 %t242, label %body15, label %endloop15
body15:
  %t243 = load i64, ptr %local.qx.98
  %t244 = load i64, ptr %local.qy.99
  %t245 = load i64, ptr %local.qz.100
  %t246 = call i64 @"ksq"(i64 %t243, i64 %t244, i64 %t245)
  store i64 %t246, ptr %local.q2.101
  %t247 = load i64, ptr %local.q2.101
  %t248 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.18)
  %t249 = call i64 @"sx_f64_gt"(i64 %t247, i64 %t248)
  %t250 = icmp ne i64 %t249, 0
  br i1 %t250, label %then16, label %else16
then16:
  %t251 = load i64, ptr %local.kx
  %t252 = load i64, ptr %local.qx.98
  %t253 = add i64 %t251, %t252
  store i64 %t253, ptr %local.target_x.102
  %t254 = load i64, ptr %local.ky
  %t255 = load i64, ptr %local.qy.99
  %t256 = add i64 %t254, %t255
  store i64 %t256, ptr %local.target_y.103
  %t257 = load i64, ptr %local.kz
  %t258 = load i64, ptr %local.qz.100
  %t259 = add i64 %t257, %t258
  store i64 %t259, ptr %local.target_z.104
  %t260 = load i64, ptr %local.target_x.102
  %t261 = load i64, ptr %local.target_y.103
  %t262 = load i64, ptr %local.target_z.104
  %t263 = call i64 @"ksq"(i64 %t260, i64 %t261, i64 %t262)
  store i64 %t263, ptr %local.p2.105
  %t264 = load i64, ptr %local.p2.105
  %t265 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.19)
  %t266 = call i64 @"sx_f64_gt"(i64 %t264, i64 %t265)
  %t267 = icmp ne i64 %t266, 0
  br i1 %t267, label %then17, label %else17
then17:
  %t268 = load i64, ptr %local.p2.105
  %t269 = load i64, ptr %local.nf.81
  %t270 = load i64, ptr %local.nf.81
  %t271 = call i64 @"sx_f64_mul"(i64 %t269, i64 %t270)
  %t272 = call i64 @"sx_f64_le"(i64 %t268, i64 %t271)
  %t273 = icmp ne i64 %t272, 0
  br i1 %t273, label %then18, label %else18
then18:
  %t274 = load i64, ptr %local.qx.98
  %t275 = load i64, ptr %local.qy.99
  %t276 = load i64, ptr %local.qz.100
  %t277 = load i64, ptr %local.target_x.102
  %t278 = load i64, ptr %local.target_y.103
  %t279 = load i64, ptr %local.target_z.104
  %t280 = call i64 @"dot3"(i64 %t274, i64 %t275, i64 %t276, i64 %t277, i64 %t278, i64 %t279)
  store i64 %t280, ptr %local.qp.106
  %t281 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.20)
  store i64 %t281, ptr %local.sin2.107
  %t282 = load i64, ptr %local.q2.101
  %t283 = load i64, ptr %local.p2.105
  %t284 = call i64 @"sx_f64_mul"(i64 %t282, i64 %t283)
  %t285 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.21)
  %t286 = call i64 @"sx_f64_gt"(i64 %t284, i64 %t285)
  %t287 = icmp ne i64 %t286, 0
  br i1 %t287, label %then19, label %else19
then19:
  %t288 = load i64, ptr %local.qp.106
  %t289 = load i64, ptr %local.qp.106
  %t290 = call i64 @"sx_f64_mul"(i64 %t288, i64 %t289)
  %t291 = load i64, ptr %local.q2.101
  %t292 = load i64, ptr %local.p2.105
  %t293 = call i64 @"sx_f64_mul"(i64 %t291, i64 %t292)
  %t294 = call i64 @"sx_f64_div"(i64 %t290, i64 %t293)
  store i64 %t294, ptr %local.cos2.108
  %t295 = load i64, ptr %local.cos2.108
  %t296 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.22)
  %t297 = call i64 @"sx_f64_lt"(i64 %t295, i64 %t296)
  %t298 = icmp ne i64 %t297, 0
  br i1 %t298, label %then20, label %else20
then20:
  %t299 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.23)
  %t300 = load i64, ptr %local.cos2.108
  %t301 = call i64 @"sx_f64_sub"(i64 %t299, i64 %t300)
  store i64 %t301, ptr %local.sin2.107
  br label %then20_end
then20_end:
  br label %endif20
else20:
  %t302 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.24)
  store i64 %t302, ptr %local.sin2.107
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t303 = phi i64 [ 0, %then20_end ], [ 0, %else20_end ]
  br label %then19_end
then19_end:
  br label %endif19
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t304 = phi i64 [ %t303, %then19_end ], [ 0, %else19_end ]
  %t305 = load i64, ptr %local.s_out.84
  %t306 = load i64, ptr %local.q2.101
  %t307 = load i64, ptr %local.u_k_sq.97
  %t308 = call i64 @"sx_f64_mul"(i64 %t306, i64 %t307)
  %t309 = load i64, ptr %local.sin2.107
  %t310 = call i64 @"sx_f64_mul"(i64 %t308, i64 %t309)
  %t311 = call i64 @"sx_f64_add"(i64 %t305, i64 %t310)
  store i64 %t311, ptr %local.s_out.84
  br label %then18_end
then18_end:
  br label %endif18
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t312 = phi i64 [ 0, %then18_end ], [ 0, %else18_end ]
  br label %then17_end
then17_end:
  br label %endif17
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t313 = phi i64 [ %t312, %then17_end ], [ 0, %else17_end ]
  br label %then16_end
then16_end:
  br label %endif16
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t314 = phi i64 [ %t313, %then16_end ], [ 0, %else16_end ]
  %t315 = load i64, ptr %local.qz.100
  %t316 = add i64 %t315, 1
  store i64 %t316, ptr %local.qz.100
  br label %loop15
endloop15:
  %t317 = load i64, ptr %local.qy.99
  %t318 = add i64 %t317, 1
  store i64 %t318, ptr %local.qy.99
  br label %loop14
endloop14:
  %t319 = load i64, ptr %local.qx.98
  %t320 = add i64 %t319, 1
  store i64 %t320, ptr %local.qx.98
  br label %loop13
endloop13:
  %t321 = load i64, ptr %local.s_in.83
  %t322 = load i64, ptr %local.s_out.84
  %t323 = call i64 @"sx_f64_sub"(i64 %t321, i64 %t322)
  ret i64 %t323
}

define i64 @"bootstrap_pass"(i64 %omega_max, i64 %n_max, i64 %nu) nounwind {
entry:
  %local.enstrophy_growth.324 = alloca i64
  %local.enstrophy_dissipation.325 = alloca i64
  %local.k_val.326 = alloca i64
  %local.k_f.327 = alloca i64
  %local.k2.328 = alloca i64
  %local.k4.329 = alloca i64
  %local.t_k.330 = alloca i64
  %local.u_k_sq.331 = alloca i64
  %local.net_rate.332 = alloca i64
  %local.omega_max = alloca i64
  store i64 %omega_max, ptr %local.omega_max
  %local.n_max = alloca i64
  store i64 %n_max, ptr %local.n_max
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %t333 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.25)
  store i64 %t333, ptr %local.enstrophy_growth.324
  %t334 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.26)
  store i64 %t334, ptr %local.enstrophy_dissipation.325
  store i64 1, ptr %local.k_val.326
  br label %loop21
loop21:
  %t335 = load i64, ptr %local.k_val.326
  %t336 = load i64, ptr %local.n_max
  %t337 = icmp sle i64 %t335, %t336
  %t338 = zext i1 %t337 to i64
  %t339 = icmp ne i64 %t338, 0
  br i1 %t339, label %body21, label %endloop21
body21:
  %t340 = load i64, ptr %local.k_val.326
  %t341 = call i64 @"sx_int_to_f64"(i64 %t340)
  store i64 %t341, ptr %local.k_f.327
  %t342 = load i64, ptr %local.k_f.327
  %t343 = load i64, ptr %local.k_f.327
  %t344 = call i64 @"sx_f64_mul"(i64 %t342, i64 %t343)
  store i64 %t344, ptr %local.k2.328
  %t345 = load i64, ptr %local.k2.328
  %t346 = load i64, ptr %local.k2.328
  %t347 = call i64 @"sx_f64_mul"(i64 %t345, i64 %t346)
  store i64 %t347, ptr %local.k4.329
  %t348 = load i64, ptr %local.k_val.326
  %t349 = load i64, ptr %local.n_max
  %t350 = load i64, ptr %local.omega_max
  %t351 = call i64 @"net_transfer_bounded"(i64 %t348, i64 0, i64 0, i64 %t349, i64 %t350)
  store i64 %t351, ptr %local.t_k.330
  %t352 = load i64, ptr %local.enstrophy_growth.324
  %t353 = load i64, ptr %local.k2.328
  %t354 = load i64, ptr %local.t_k.330
  %t355 = call i64 @"sx_f64_mul"(i64 %t353, i64 %t354)
  %t356 = call i64 @"sx_f64_add"(i64 %t352, i64 %t355)
  store i64 %t356, ptr %local.enstrophy_growth.324
  %t357 = load i64, ptr %local.k2.328
  %t358 = load i64, ptr %local.omega_max
  %t359 = call i64 @"spectrum_bound"(i64 %t357, i64 %t358)
  store i64 %t359, ptr %local.u_k_sq.331
  %t360 = load i64, ptr %local.enstrophy_dissipation.325
  %t361 = load i64, ptr %local.nu
  %t362 = load i64, ptr %local.k4.329
  %t363 = call i64 @"sx_f64_mul"(i64 %t361, i64 %t362)
  %t364 = load i64, ptr %local.u_k_sq.331
  %t365 = call i64 @"sx_f64_mul"(i64 %t363, i64 %t364)
  %t366 = call i64 @"sx_f64_add"(i64 %t360, i64 %t365)
  store i64 %t366, ptr %local.enstrophy_dissipation.325
  %t367 = load i64, ptr %local.k_val.326
  %t368 = add i64 %t367, 1
  store i64 %t368, ptr %local.k_val.326
  br label %loop21
endloop21:
  %t369 = load i64, ptr %local.enstrophy_growth.324
  %t370 = load i64, ptr %local.enstrophy_dissipation.325
  %t371 = call i64 @"sx_f64_sub"(i64 %t369, i64 %t370)
  store i64 %t371, ptr %local.net_rate.332
  %t372 = load i64, ptr %local.omega_max
  %t373 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.27)
  %t374 = call i64 @"sx_f64_gt"(i64 %t372, i64 %t373)
  %t375 = icmp ne i64 %t374, 0
  br i1 %t375, label %then22, label %else22
then22:
  %t376 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.28)
  %t377 = load i64, ptr %local.net_rate.332
  %t378 = load i64, ptr %local.omega_max
  %t379 = call i64 @"sx_f64_div"(i64 %t377, i64 %t378)
  %t380 = call i64 @"sx_f64_add"(i64 %t376, i64 %t379)
  br label %then22_end
then22_end:
  br label %endif22
else22:
  %t381 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.29)
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t382 = phi i64 [ %t380, %then22_end ], [ %t381, %else22_end ]
  ret i64 %t382
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.nu.383 = alloca i64
  %local.omega_vals_idx.384 = alloca i64
  %local.omega.385 = alloca i64
  %local.n_test.386 = alloca i64
  %local.growth.387 = alloca i64
  %local.dissip.388 = alloca i64
  %local.k_val.389 = alloca i64
  %local.k_f.390 = alloca i64
  %local.k2.391 = alloca i64
  %local.k4.392 = alloca i64
  %local.t_k.393 = alloca i64
  %local.u_k_sq.394 = alloca i64
  %local.net.395 = alloca i64
  %local.ratio.396 = alloca i64
  %local.omega_fixed.397 = alloca i64
  %local.n_val.398 = alloca i64
  %local.ratio.399 = alloca i64
  %local.omega_iter.400 = alloca i64
  %local.n_bootstrap.401 = alloca i64
  %local.iter.402 = alloca i64
  %local.converged.403 = alloca i64
  %local.prev_omega.404 = alloca i64
  %local.ratio.405 = alloca i64
  %local.new_omega.406 = alloca i64
  %local.change.407 = alloca i64
  %local.max_dev.408 = alloca i64
  %local.test_idx.409 = alloca i64
  %local.test_omega.410 = alloca i64
  %local.r.411 = alloca i64
  %local.dev.412 = alloca i64
  %t413 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.30)
  store i64 %t413, ptr %local.nu.383
  %t414 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.31)
  %t415 = ptrtoint ptr %t414 to i64
  %t416 = inttoptr i64 %t415 to ptr
  call void @intrinsic_println(ptr %t416)
  %t417 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.32)
  %t418 = ptrtoint ptr %t417 to i64
  %t419 = inttoptr i64 %t418 to ptr
  call void @intrinsic_println(ptr %t419)
  %t420 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.33)
  %t421 = ptrtoint ptr %t420 to i64
  %t422 = inttoptr i64 %t421 to ptr
  call void @intrinsic_println(ptr %t422)
  %t423 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.34)
  %t424 = ptrtoint ptr %t423 to i64
  %t425 = inttoptr i64 %t424 to ptr
  call void @intrinsic_println(ptr %t425)
  %t426 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.35)
  %t427 = ptrtoint ptr %t426 to i64
  %t428 = inttoptr i64 %t427 to ptr
  call void @intrinsic_println(ptr %t428)
  %t429 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.36)
  %t430 = ptrtoint ptr %t429 to i64
  %t431 = inttoptr i64 %t430 to ptr
  call void @intrinsic_println(ptr %t431)
  %t432 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.37)
  %t433 = ptrtoint ptr %t432 to i64
  %t434 = inttoptr i64 %t433 to ptr
  call void @intrinsic_println(ptr %t434)
  %t435 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.38)
  %t436 = ptrtoint ptr %t435 to i64
  %t437 = inttoptr i64 %t436 to ptr
  call void @intrinsic_println(ptr %t437)
  %t438 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.39)
  %t439 = ptrtoint ptr %t438 to i64
  %t440 = inttoptr i64 %t439 to ptr
  call void @intrinsic_println(ptr %t440)
  %t441 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.40)
  %t442 = ptrtoint ptr %t441 to i64
  %t443 = inttoptr i64 %t442 to ptr
  call void @intrinsic_println(ptr %t443)
  %t444 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.41)
  %t445 = ptrtoint ptr %t444 to i64
  %t446 = inttoptr i64 %t445 to ptr
  call void @intrinsic_println(ptr %t446)
  %t447 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.42)
  %t448 = ptrtoint ptr %t447 to i64
  %t449 = inttoptr i64 %t448 to ptr
  call void @intrinsic_println(ptr %t449)
  %t450 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.43)
  %t451 = ptrtoint ptr %t450 to i64
  %t452 = inttoptr i64 %t451 to ptr
  call void @intrinsic_println(ptr %t452)
  %t453 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.44)
  %t454 = ptrtoint ptr %t453 to i64
  %t455 = inttoptr i64 %t454 to ptr
  call void @intrinsic_println(ptr %t455)
  %t456 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.45)
  %t457 = ptrtoint ptr %t456 to i64
  %t458 = inttoptr i64 %t457 to ptr
  call void @intrinsic_println(ptr %t458)
  %t459 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.46)
  %t460 = ptrtoint ptr %t459 to i64
  %t461 = inttoptr i64 %t460 to ptr
  call void @intrinsic_println(ptr %t461)
  store i64 0, ptr %local.omega_vals_idx.384
  br label %loop23
loop23:
  %t462 = load i64, ptr %local.omega_vals_idx.384
  %t463 = icmp slt i64 %t462, 10
  %t464 = zext i1 %t463 to i64
  %t465 = icmp ne i64 %t464, 0
  br i1 %t465, label %body23, label %endloop23
body23:
  %t466 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.47)
  store i64 %t466, ptr %local.omega.385
  %t467 = load i64, ptr %local.omega_vals_idx.384
  %t468 = icmp eq i64 %t467, 0
  %t469 = zext i1 %t468 to i64
  %t470 = icmp ne i64 %t469, 0
  br i1 %t470, label %then24, label %else24
then24:
  %t471 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.48)
  store i64 %t471, ptr %local.omega.385
  br label %then24_end
then24_end:
  br label %endif24
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t472 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  %t473 = load i64, ptr %local.omega_vals_idx.384
  %t474 = icmp eq i64 %t473, 1
  %t475 = zext i1 %t474 to i64
  %t476 = icmp ne i64 %t475, 0
  br i1 %t476, label %then25, label %else25
then25:
  %t477 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.49)
  store i64 %t477, ptr %local.omega.385
  br label %then25_end
then25_end:
  br label %endif25
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t478 = phi i64 [ 0, %then25_end ], [ 0, %else25_end ]
  %t479 = load i64, ptr %local.omega_vals_idx.384
  %t480 = icmp eq i64 %t479, 2
  %t481 = zext i1 %t480 to i64
  %t482 = icmp ne i64 %t481, 0
  br i1 %t482, label %then26, label %else26
then26:
  %t483 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.50)
  store i64 %t483, ptr %local.omega.385
  br label %then26_end
then26_end:
  br label %endif26
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t484 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  %t485 = load i64, ptr %local.omega_vals_idx.384
  %t486 = icmp eq i64 %t485, 3
  %t487 = zext i1 %t486 to i64
  %t488 = icmp ne i64 %t487, 0
  br i1 %t488, label %then27, label %else27
then27:
  %t489 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.51)
  store i64 %t489, ptr %local.omega.385
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t490 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  %t491 = load i64, ptr %local.omega_vals_idx.384
  %t492 = icmp eq i64 %t491, 4
  %t493 = zext i1 %t492 to i64
  %t494 = icmp ne i64 %t493, 0
  br i1 %t494, label %then28, label %else28
then28:
  %t495 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.52)
  store i64 %t495, ptr %local.omega.385
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t496 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  %t497 = load i64, ptr %local.omega_vals_idx.384
  %t498 = icmp eq i64 %t497, 5
  %t499 = zext i1 %t498 to i64
  %t500 = icmp ne i64 %t499, 0
  br i1 %t500, label %then29, label %else29
then29:
  %t501 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.53)
  store i64 %t501, ptr %local.omega.385
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t502 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  %t503 = load i64, ptr %local.omega_vals_idx.384
  %t504 = icmp eq i64 %t503, 6
  %t505 = zext i1 %t504 to i64
  %t506 = icmp ne i64 %t505, 0
  br i1 %t506, label %then30, label %else30
then30:
  %t507 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.54)
  store i64 %t507, ptr %local.omega.385
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t508 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  %t509 = load i64, ptr %local.omega_vals_idx.384
  %t510 = icmp eq i64 %t509, 7
  %t511 = zext i1 %t510 to i64
  %t512 = icmp ne i64 %t511, 0
  br i1 %t512, label %then31, label %else31
then31:
  %t513 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.55)
  store i64 %t513, ptr %local.omega.385
  br label %then31_end
then31_end:
  br label %endif31
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t514 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  %t515 = load i64, ptr %local.omega_vals_idx.384
  %t516 = icmp eq i64 %t515, 8
  %t517 = zext i1 %t516 to i64
  %t518 = icmp ne i64 %t517, 0
  br i1 %t518, label %then32, label %else32
then32:
  %t519 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.56)
  store i64 %t519, ptr %local.omega.385
  br label %then32_end
then32_end:
  br label %endif32
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t520 = phi i64 [ 0, %then32_end ], [ 0, %else32_end ]
  %t521 = load i64, ptr %local.omega_vals_idx.384
  %t522 = icmp eq i64 %t521, 9
  %t523 = zext i1 %t522 to i64
  %t524 = icmp ne i64 %t523, 0
  br i1 %t524, label %then33, label %else33
then33:
  %t525 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.57)
  store i64 %t525, ptr %local.omega.385
  br label %then33_end
then33_end:
  br label %endif33
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t526 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  store i64 6, ptr %local.n_test.386
  %t527 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.58)
  store i64 %t527, ptr %local.growth.387
  %t528 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.59)
  store i64 %t528, ptr %local.dissip.388
  store i64 1, ptr %local.k_val.389
  br label %loop34
loop34:
  %t529 = load i64, ptr %local.k_val.389
  %t530 = load i64, ptr %local.n_test.386
  %t531 = icmp sle i64 %t529, %t530
  %t532 = zext i1 %t531 to i64
  %t533 = icmp ne i64 %t532, 0
  br i1 %t533, label %body34, label %endloop34
body34:
  %t534 = load i64, ptr %local.k_val.389
  %t535 = call i64 @"sx_int_to_f64"(i64 %t534)
  store i64 %t535, ptr %local.k_f.390
  %t536 = load i64, ptr %local.k_f.390
  %t537 = load i64, ptr %local.k_f.390
  %t538 = call i64 @"sx_f64_mul"(i64 %t536, i64 %t537)
  store i64 %t538, ptr %local.k2.391
  %t539 = load i64, ptr %local.k2.391
  %t540 = load i64, ptr %local.k2.391
  %t541 = call i64 @"sx_f64_mul"(i64 %t539, i64 %t540)
  store i64 %t541, ptr %local.k4.392
  %t542 = load i64, ptr %local.k_val.389
  %t543 = load i64, ptr %local.n_test.386
  %t544 = load i64, ptr %local.omega.385
  %t545 = call i64 @"net_transfer_bounded"(i64 %t542, i64 0, i64 0, i64 %t543, i64 %t544)
  store i64 %t545, ptr %local.t_k.393
  %t546 = load i64, ptr %local.growth.387
  %t547 = load i64, ptr %local.k2.391
  %t548 = load i64, ptr %local.t_k.393
  %t549 = call i64 @"sx_f64_mul"(i64 %t547, i64 %t548)
  %t550 = call i64 @"sx_f64_add"(i64 %t546, i64 %t549)
  store i64 %t550, ptr %local.growth.387
  %t551 = load i64, ptr %local.k2.391
  %t552 = load i64, ptr %local.omega.385
  %t553 = call i64 @"spectrum_bound"(i64 %t551, i64 %t552)
  store i64 %t553, ptr %local.u_k_sq.394
  %t554 = load i64, ptr %local.dissip.388
  %t555 = load i64, ptr %local.nu.383
  %t556 = load i64, ptr %local.k4.392
  %t557 = call i64 @"sx_f64_mul"(i64 %t555, i64 %t556)
  %t558 = load i64, ptr %local.u_k_sq.394
  %t559 = call i64 @"sx_f64_mul"(i64 %t557, i64 %t558)
  %t560 = call i64 @"sx_f64_add"(i64 %t554, i64 %t559)
  store i64 %t560, ptr %local.dissip.388
  %t561 = load i64, ptr %local.k_val.389
  %t562 = add i64 %t561, 1
  store i64 %t562, ptr %local.k_val.389
  br label %loop34
endloop34:
  %t563 = load i64, ptr %local.growth.387
  %t564 = load i64, ptr %local.dissip.388
  %t565 = call i64 @"sx_f64_sub"(i64 %t563, i64 %t564)
  store i64 %t565, ptr %local.net.395
  %t566 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.60)
  store i64 %t566, ptr %local.ratio.396
  %t567 = load i64, ptr %local.omega.385
  %t568 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.61)
  %t569 = call i64 @"sx_f64_gt"(i64 %t567, i64 %t568)
  %t570 = icmp ne i64 %t569, 0
  br i1 %t570, label %then35, label %else35
then35:
  %t571 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.62)
  %t572 = load i64, ptr %local.net.395
  %t573 = load i64, ptr %local.omega.385
  %t574 = call i64 @"sx_f64_div"(i64 %t572, i64 %t573)
  %t575 = call i64 @"sx_f64_add"(i64 %t571, i64 %t574)
  store i64 %t575, ptr %local.ratio.396
  br label %then35_end
then35_end:
  br label %endif35
else35:
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t576 = phi i64 [ 0, %then35_end ], [ 0, %else35_end ]
  %t577 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.63)
  %t578 = ptrtoint ptr %t577 to i64
  %t579 = inttoptr i64 %t578 to ptr
  call void @intrinsic_print(ptr %t579)
  %t580 = load i64, ptr %local.omega.385
  %t581 = call i64 @"print_f64"(i64 %t580)
  %t582 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.64)
  %t583 = ptrtoint ptr %t582 to i64
  %t584 = inttoptr i64 %t583 to ptr
  call void @intrinsic_print(ptr %t584)
  %t585 = load i64, ptr %local.growth.387
  %t586 = call i64 @"print_f64"(i64 %t585)
  %t587 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.65)
  %t588 = ptrtoint ptr %t587 to i64
  %t589 = inttoptr i64 %t588 to ptr
  call void @intrinsic_print(ptr %t589)
  %t590 = load i64, ptr %local.dissip.388
  %t591 = call i64 @"print_f64"(i64 %t590)
  %t592 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.66)
  %t593 = ptrtoint ptr %t592 to i64
  %t594 = inttoptr i64 %t593 to ptr
  call void @intrinsic_print(ptr %t594)
  %t595 = load i64, ptr %local.net.395
  %t596 = call i64 @"print_f64"(i64 %t595)
  %t597 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.67)
  %t598 = ptrtoint ptr %t597 to i64
  %t599 = inttoptr i64 %t598 to ptr
  call void @intrinsic_print(ptr %t599)
  %t600 = load i64, ptr %local.ratio.396
  %t601 = call i64 @"print_f64"(i64 %t600)
  %t602 = load i64, ptr %local.ratio.396
  %t603 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.68)
  %t604 = call i64 @"sx_f64_lt"(i64 %t602, i64 %t603)
  %t605 = icmp ne i64 %t604, 0
  br i1 %t605, label %then36, label %else36
then36:
  %t606 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.69)
  %t607 = ptrtoint ptr %t606 to i64
  %t608 = inttoptr i64 %t607 to ptr
  call void @intrinsic_println(ptr %t608)
  br label %then36_end
then36_end:
  br label %endif36
else36:
  %t609 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.70)
  %t610 = ptrtoint ptr %t609 to i64
  %t611 = inttoptr i64 %t610 to ptr
  call void @intrinsic_println(ptr %t611)
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t612 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  %t613 = load i64, ptr %local.omega_vals_idx.384
  %t614 = add i64 %t613, 1
  store i64 %t614, ptr %local.omega_vals_idx.384
  br label %loop23
endloop23:
  %t615 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.71)
  %t616 = ptrtoint ptr %t615 to i64
  %t617 = inttoptr i64 %t616 to ptr
  call void @intrinsic_println(ptr %t617)
  %t618 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.72)
  %t619 = ptrtoint ptr %t618 to i64
  %t620 = inttoptr i64 %t619 to ptr
  call void @intrinsic_println(ptr %t620)
  %t621 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.73)
  %t622 = ptrtoint ptr %t621 to i64
  %t623 = inttoptr i64 %t622 to ptr
  call void @intrinsic_println(ptr %t623)
  %t624 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.74)
  %t625 = ptrtoint ptr %t624 to i64
  %t626 = inttoptr i64 %t625 to ptr
  call void @intrinsic_println(ptr %t626)
  %t627 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.75)
  %t628 = ptrtoint ptr %t627 to i64
  %t629 = inttoptr i64 %t628 to ptr
  call void @intrinsic_println(ptr %t629)
  %t630 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.76)
  store i64 %t630, ptr %local.omega_fixed.397
  store i64 2, ptr %local.n_val.398
  br label %loop37
loop37:
  %t631 = load i64, ptr %local.n_val.398
  %t632 = icmp sle i64 %t631, 8
  %t633 = zext i1 %t632 to i64
  %t634 = icmp ne i64 %t633, 0
  br i1 %t634, label %body37, label %endloop37
body37:
  %t635 = load i64, ptr %local.omega_fixed.397
  %t636 = load i64, ptr %local.n_val.398
  %t637 = load i64, ptr %local.nu.383
  %t638 = call i64 @"bootstrap_pass"(i64 %t635, i64 %t636, i64 %t637)
  store i64 %t638, ptr %local.ratio.399
  %t639 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.77)
  %t640 = ptrtoint ptr %t639 to i64
  %t641 = inttoptr i64 %t640 to ptr
  call void @intrinsic_print(ptr %t641)
  %t642 = load i64, ptr %local.n_val.398
  call void @print_i64(i64 %t642)
  %t643 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.78)
  %t644 = ptrtoint ptr %t643 to i64
  %t645 = inttoptr i64 %t644 to ptr
  call void @intrinsic_print(ptr %t645)
  %t646 = load i64, ptr %local.ratio.399
  %t647 = call i64 @"print_f64"(i64 %t646)
  %t648 = load i64, ptr %local.ratio.399
  %t649 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.79)
  %t650 = call i64 @"sx_f64_lt"(i64 %t648, i64 %t649)
  %t651 = icmp ne i64 %t650, 0
  br i1 %t651, label %then38, label %else38
then38:
  %t652 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.80)
  %t653 = ptrtoint ptr %t652 to i64
  %t654 = inttoptr i64 %t653 to ptr
  call void @intrinsic_println(ptr %t654)
  br label %then38_end
then38_end:
  br label %endif38
else38:
  %t655 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.81)
  %t656 = ptrtoint ptr %t655 to i64
  %t657 = inttoptr i64 %t656 to ptr
  call void @intrinsic_println(ptr %t657)
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t658 = phi i64 [ 0, %then38_end ], [ 0, %else38_end ]
  %t659 = load i64, ptr %local.n_val.398
  %t660 = add i64 %t659, 1
  store i64 %t660, ptr %local.n_val.398
  br label %loop37
endloop37:
  %t661 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.82)
  %t662 = ptrtoint ptr %t661 to i64
  %t663 = inttoptr i64 %t662 to ptr
  call void @intrinsic_println(ptr %t663)
  %t664 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.83)
  %t665 = ptrtoint ptr %t664 to i64
  %t666 = inttoptr i64 %t665 to ptr
  call void @intrinsic_println(ptr %t666)
  %t667 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.84)
  %t668 = ptrtoint ptr %t667 to i64
  %t669 = inttoptr i64 %t668 to ptr
  call void @intrinsic_println(ptr %t669)
  %t670 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.85)
  %t671 = ptrtoint ptr %t670 to i64
  %t672 = inttoptr i64 %t671 to ptr
  call void @intrinsic_println(ptr %t672)
  %t673 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.86)
  %t674 = ptrtoint ptr %t673 to i64
  %t675 = inttoptr i64 %t674 to ptr
  call void @intrinsic_println(ptr %t675)
  %t676 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.87)
  %t677 = ptrtoint ptr %t676 to i64
  %t678 = inttoptr i64 %t677 to ptr
  call void @intrinsic_println(ptr %t678)
  %t679 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.88)
  %t680 = ptrtoint ptr %t679 to i64
  %t681 = inttoptr i64 %t680 to ptr
  call void @intrinsic_println(ptr %t681)
  %t682 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.89)
  %t683 = ptrtoint ptr %t682 to i64
  %t684 = inttoptr i64 %t683 to ptr
  call void @intrinsic_println(ptr %t684)
  %t685 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.90)
  store i64 %t685, ptr %local.omega_iter.400
  store i64 6, ptr %local.n_bootstrap.401
  store i64 0, ptr %local.iter.402
  store i64 0, ptr %local.converged.403
  %t686 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.91)
  store i64 %t686, ptr %local.prev_omega.404
  br label %loop39
loop39:
  %t687 = load i64, ptr %local.iter.402
  %t688 = icmp slt i64 %t687, 20
  %t689 = zext i1 %t688 to i64
  %t690 = icmp ne i64 %t689, 0
  br i1 %t690, label %body39, label %endloop39
body39:
  %t691 = load i64, ptr %local.omega_iter.400
  %t692 = load i64, ptr %local.n_bootstrap.401
  %t693 = load i64, ptr %local.nu.383
  %t694 = call i64 @"bootstrap_pass"(i64 %t691, i64 %t692, i64 %t693)
  store i64 %t694, ptr %local.ratio.405
  %t695 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.92)
  %t696 = ptrtoint ptr %t695 to i64
  %t697 = inttoptr i64 %t696 to ptr
  call void @intrinsic_print(ptr %t697)
  %t698 = load i64, ptr %local.iter.402
  call void @print_i64(i64 %t698)
  %t699 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.93)
  %t700 = ptrtoint ptr %t699 to i64
  %t701 = inttoptr i64 %t700 to ptr
  call void @intrinsic_print(ptr %t701)
  %t702 = load i64, ptr %local.omega_iter.400
  %t703 = call i64 @"print_f64"(i64 %t702)
  %t704 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.94)
  %t705 = ptrtoint ptr %t704 to i64
  %t706 = inttoptr i64 %t705 to ptr
  call void @intrinsic_print(ptr %t706)
  %t707 = load i64, ptr %local.ratio.405
  %t708 = call i64 @"print_f64"(i64 %t707)
  %t709 = load i64, ptr %local.omega_iter.400
  %t710 = load i64, ptr %local.ratio.405
  %t711 = call i64 @"sx_f64_mul"(i64 %t709, i64 %t710)
  store i64 %t711, ptr %local.new_omega.406
  %t712 = load i64, ptr %local.ratio.405
  %t713 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.95)
  %t714 = call i64 @"sx_f64_lt"(i64 %t712, i64 %t713)
  %t715 = icmp ne i64 %t714, 0
  br i1 %t715, label %then40, label %else40
then40:
  %t716 = load i64, ptr %local.ratio.405
  %t717 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.96)
  %t718 = call i64 @"sx_f64_gt"(i64 %t716, i64 %t717)
  %t719 = icmp ne i64 %t718, 0
  br i1 %t719, label %then41, label %else41
then41:
  %t720 = load i64, ptr %local.new_omega.406
  %t721 = load i64, ptr %local.omega_iter.400
  %t722 = call i64 @"sx_f64_sub"(i64 %t720, i64 %t721)
  %t723 = call i64 @"abs_f64"(i64 %t722)
  %t724 = load i64, ptr %local.omega_iter.400
  %t725 = call i64 @"sx_f64_div"(i64 %t723, i64 %t724)
  store i64 %t725, ptr %local.change.407
  %t726 = load i64, ptr %local.change.407
  %t727 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.97)
  %t728 = call i64 @"sx_f64_lt"(i64 %t726, i64 %t727)
  %t729 = icmp ne i64 %t728, 0
  br i1 %t729, label %then42, label %else42
then42:
  %t730 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.98)
  %t731 = ptrtoint ptr %t730 to i64
  %t732 = inttoptr i64 %t731 to ptr
  call void @intrinsic_println(ptr %t732)
  store i64 1, ptr %local.converged.403
  br label %then42_end
then42_end:
  br label %endif42
else42:
  %t733 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.99)
  %t734 = ptrtoint ptr %t733 to i64
  %t735 = inttoptr i64 %t734 to ptr
  call void @intrinsic_println(ptr %t735)
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t736 = phi i64 [ 0, %then42_end ], [ 0, %else42_end ]
  %t737 = load i64, ptr %local.new_omega.406
  store i64 %t737, ptr %local.omega_iter.400
  br label %then41_end
then41_end:
  br label %endif41
else41:
  %t738 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.100)
  %t739 = ptrtoint ptr %t738 to i64
  %t740 = inttoptr i64 %t739 to ptr
  call void @intrinsic_println(ptr %t740)
  %t741 = load i64, ptr %local.omega_iter.400
  %t742 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.101)
  %t743 = call i64 @"sx_f64_mul"(i64 %t741, i64 %t742)
  store i64 %t743, ptr %local.omega_iter.400
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t744 = phi i64 [ 0, %then41_end ], [ 0, %else41_end ]
  br label %then40_end
then40_end:
  br label %endif40
else40:
  %t745 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.102)
  %t746 = ptrtoint ptr %t745 to i64
  %t747 = inttoptr i64 %t746 to ptr
  call void @intrinsic_println(ptr %t747)
  %t748 = load i64, ptr %local.omega_iter.400
  %t749 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.103)
  %t750 = call i64 @"sx_f64_mul"(i64 %t748, i64 %t749)
  store i64 %t750, ptr %local.omega_iter.400
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t751 = phi i64 [ %t744, %then40_end ], [ 0, %else40_end ]
  %t752 = load i64, ptr %local.omega_iter.400
  store i64 %t752, ptr %local.prev_omega.404
  %t753 = load i64, ptr %local.iter.402
  %t754 = add i64 %t753, 1
  store i64 %t754, ptr %local.iter.402
  %t755 = load i64, ptr %local.converged.403
  %t756 = icmp eq i64 %t755, 1
  %t757 = zext i1 %t756 to i64
  %t758 = icmp ne i64 %t757, 0
  br i1 %t758, label %then43, label %else43
then43:
  store i64 100, ptr %local.iter.402
  br label %then43_end
then43_end:
  br label %endif43
else43:
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t759 = phi i64 [ 0, %then43_end ], [ 0, %else43_end ]
  br label %loop39
endloop39:
  %t760 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.104)
  %t761 = ptrtoint ptr %t760 to i64
  %t762 = inttoptr i64 %t761 to ptr
  call void @intrinsic_println(ptr %t762)
  %t763 = load i64, ptr %local.converged.403
  %t764 = icmp eq i64 %t763, 1
  %t765 = zext i1 %t764 to i64
  %t766 = icmp ne i64 %t765, 0
  br i1 %t766, label %then44, label %else44
then44:
  %t767 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.105)
  %t768 = ptrtoint ptr %t767 to i64
  %t769 = inttoptr i64 %t768 to ptr
  call void @intrinsic_print(ptr %t769)
  %t770 = load i64, ptr %local.omega_iter.400
  %t771 = call i64 @"print_f64"(i64 %t770)
  %t772 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.106)
  %t773 = ptrtoint ptr %t772 to i64
  %t774 = inttoptr i64 %t773 to ptr
  call void @intrinsic_println(ptr %t774)
  %t775 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.107)
  %t776 = ptrtoint ptr %t775 to i64
  %t777 = inttoptr i64 %t776 to ptr
  call void @intrinsic_println(ptr %t777)
  %t778 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.108)
  %t779 = ptrtoint ptr %t778 to i64
  %t780 = inttoptr i64 %t779 to ptr
  call void @intrinsic_println(ptr %t780)
  %t781 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.109)
  %t782 = ptrtoint ptr %t781 to i64
  %t783 = inttoptr i64 %t782 to ptr
  call void @intrinsic_println(ptr %t783)
  %t784 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.110)
  %t785 = ptrtoint ptr %t784 to i64
  %t786 = inttoptr i64 %t785 to ptr
  call void @intrinsic_println(ptr %t786)
  %t787 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.111)
  %t788 = ptrtoint ptr %t787 to i64
  %t789 = inttoptr i64 %t788 to ptr
  call void @intrinsic_println(ptr %t789)
  %t790 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.112)
  %t791 = ptrtoint ptr %t790 to i64
  %t792 = inttoptr i64 %t791 to ptr
  call void @intrinsic_println(ptr %t792)
  %t793 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.113)
  %t794 = ptrtoint ptr %t793 to i64
  %t795 = inttoptr i64 %t794 to ptr
  call void @intrinsic_println(ptr %t795)
  %t796 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.114)
  %t797 = ptrtoint ptr %t796 to i64
  %t798 = inttoptr i64 %t797 to ptr
  call void @intrinsic_println(ptr %t798)
  %t799 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.115)
  %t800 = ptrtoint ptr %t799 to i64
  %t801 = inttoptr i64 %t800 to ptr
  call void @intrinsic_println(ptr %t801)
  %t802 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.116)
  %t803 = ptrtoint ptr %t802 to i64
  %t804 = inttoptr i64 %t803 to ptr
  call void @intrinsic_println(ptr %t804)
  %t805 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.117)
  %t806 = ptrtoint ptr %t805 to i64
  %t807 = inttoptr i64 %t806 to ptr
  call void @intrinsic_println(ptr %t807)
  %t808 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.118)
  %t809 = ptrtoint ptr %t808 to i64
  %t810 = inttoptr i64 %t809 to ptr
  call void @intrinsic_println(ptr %t810)
  %t811 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.119)
  %t812 = ptrtoint ptr %t811 to i64
  %t813 = inttoptr i64 %t812 to ptr
  call void @intrinsic_println(ptr %t813)
  br label %then44_end
then44_end:
  br label %endif44
else44:
  %t814 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.120)
  %t815 = ptrtoint ptr %t814 to i64
  %t816 = inttoptr i64 %t815 to ptr
  call void @intrinsic_println(ptr %t816)
  %t817 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.121)
  %t818 = ptrtoint ptr %t817 to i64
  %t819 = inttoptr i64 %t818 to ptr
  call void @intrinsic_println(ptr %t819)
  br label %else44_end
else44_end:
  br label %endif44
endif44:
  %t820 = phi i64 [ 0, %then44_end ], [ 0, %else44_end ]
  %t821 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.122)
  %t822 = ptrtoint ptr %t821 to i64
  %t823 = inttoptr i64 %t822 to ptr
  call void @intrinsic_println(ptr %t823)
  %t824 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.123)
  %t825 = ptrtoint ptr %t824 to i64
  %t826 = inttoptr i64 %t825 to ptr
  call void @intrinsic_println(ptr %t826)
  %t827 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.124)
  %t828 = ptrtoint ptr %t827 to i64
  %t829 = inttoptr i64 %t828 to ptr
  call void @intrinsic_println(ptr %t829)
  %t830 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.125)
  %t831 = ptrtoint ptr %t830 to i64
  %t832 = inttoptr i64 %t831 to ptr
  call void @intrinsic_println(ptr %t832)
  %t833 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.126)
  %t834 = ptrtoint ptr %t833 to i64
  %t835 = inttoptr i64 %t834 to ptr
  call void @intrinsic_println(ptr %t835)
  %t836 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.127)
  %t837 = ptrtoint ptr %t836 to i64
  %t838 = inttoptr i64 %t837 to ptr
  call void @intrinsic_println(ptr %t838)
  %t839 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.128)
  store i64 %t839, ptr %local.max_dev.408
  store i64 0, ptr %local.test_idx.409
  br label %loop45
loop45:
  %t840 = load i64, ptr %local.test_idx.409
  %t841 = icmp slt i64 %t840, 8
  %t842 = zext i1 %t841 to i64
  %t843 = icmp ne i64 %t842, 0
  br i1 %t843, label %body45, label %endloop45
body45:
  %t844 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.129)
  store i64 %t844, ptr %local.test_omega.410
  %t845 = load i64, ptr %local.test_idx.409
  %t846 = icmp eq i64 %t845, 0
  %t847 = zext i1 %t846 to i64
  %t848 = icmp ne i64 %t847, 0
  br i1 %t848, label %then46, label %else46
then46:
  %t849 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.130)
  store i64 %t849, ptr %local.test_omega.410
  br label %then46_end
then46_end:
  br label %endif46
else46:
  br label %else46_end
else46_end:
  br label %endif46
endif46:
  %t850 = phi i64 [ 0, %then46_end ], [ 0, %else46_end ]
  %t851 = load i64, ptr %local.test_idx.409
  %t852 = icmp eq i64 %t851, 1
  %t853 = zext i1 %t852 to i64
  %t854 = icmp ne i64 %t853, 0
  br i1 %t854, label %then47, label %else47
then47:
  %t855 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.131)
  store i64 %t855, ptr %local.test_omega.410
  br label %then47_end
then47_end:
  br label %endif47
else47:
  br label %else47_end
else47_end:
  br label %endif47
endif47:
  %t856 = phi i64 [ 0, %then47_end ], [ 0, %else47_end ]
  %t857 = load i64, ptr %local.test_idx.409
  %t858 = icmp eq i64 %t857, 2
  %t859 = zext i1 %t858 to i64
  %t860 = icmp ne i64 %t859, 0
  br i1 %t860, label %then48, label %else48
then48:
  %t861 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.132)
  store i64 %t861, ptr %local.test_omega.410
  br label %then48_end
then48_end:
  br label %endif48
else48:
  br label %else48_end
else48_end:
  br label %endif48
endif48:
  %t862 = phi i64 [ 0, %then48_end ], [ 0, %else48_end ]
  %t863 = load i64, ptr %local.test_idx.409
  %t864 = icmp eq i64 %t863, 3
  %t865 = zext i1 %t864 to i64
  %t866 = icmp ne i64 %t865, 0
  br i1 %t866, label %then49, label %else49
then49:
  %t867 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.133)
  store i64 %t867, ptr %local.test_omega.410
  br label %then49_end
then49_end:
  br label %endif49
else49:
  br label %else49_end
else49_end:
  br label %endif49
endif49:
  %t868 = phi i64 [ 0, %then49_end ], [ 0, %else49_end ]
  %t869 = load i64, ptr %local.test_idx.409
  %t870 = icmp eq i64 %t869, 4
  %t871 = zext i1 %t870 to i64
  %t872 = icmp ne i64 %t871, 0
  br i1 %t872, label %then50, label %else50
then50:
  %t873 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.134)
  store i64 %t873, ptr %local.test_omega.410
  br label %then50_end
then50_end:
  br label %endif50
else50:
  br label %else50_end
else50_end:
  br label %endif50
endif50:
  %t874 = phi i64 [ 0, %then50_end ], [ 0, %else50_end ]
  %t875 = load i64, ptr %local.test_idx.409
  %t876 = icmp eq i64 %t875, 5
  %t877 = zext i1 %t876 to i64
  %t878 = icmp ne i64 %t877, 0
  br i1 %t878, label %then51, label %else51
then51:
  %t879 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.135)
  store i64 %t879, ptr %local.test_omega.410
  br label %then51_end
then51_end:
  br label %endif51
else51:
  br label %else51_end
else51_end:
  br label %endif51
endif51:
  %t880 = phi i64 [ 0, %then51_end ], [ 0, %else51_end ]
  %t881 = load i64, ptr %local.test_idx.409
  %t882 = icmp eq i64 %t881, 6
  %t883 = zext i1 %t882 to i64
  %t884 = icmp ne i64 %t883, 0
  br i1 %t884, label %then52, label %else52
then52:
  %t885 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.136)
  store i64 %t885, ptr %local.test_omega.410
  br label %then52_end
then52_end:
  br label %endif52
else52:
  br label %else52_end
else52_end:
  br label %endif52
endif52:
  %t886 = phi i64 [ 0, %then52_end ], [ 0, %else52_end ]
  %t887 = load i64, ptr %local.test_idx.409
  %t888 = icmp eq i64 %t887, 7
  %t889 = zext i1 %t888 to i64
  %t890 = icmp ne i64 %t889, 0
  br i1 %t890, label %then53, label %else53
then53:
  %t891 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.137)
  store i64 %t891, ptr %local.test_omega.410
  br label %then53_end
then53_end:
  br label %endif53
else53:
  br label %else53_end
else53_end:
  br label %endif53
endif53:
  %t892 = phi i64 [ 0, %then53_end ], [ 0, %else53_end ]
  %t893 = load i64, ptr %local.test_omega.410
  %t894 = load i64, ptr %local.nu.383
  %t895 = call i64 @"bootstrap_pass"(i64 %t893, i64 6, i64 %t894)
  store i64 %t895, ptr %local.r.411
  %t896 = load i64, ptr %local.r.411
  %t897 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.138)
  %t898 = call i64 @"sx_f64_sub"(i64 %t896, i64 %t897)
  %t899 = call i64 @"abs_f64"(i64 %t898)
  store i64 %t899, ptr %local.dev.412
  %t900 = load i64, ptr %local.dev.412
  %t901 = load i64, ptr %local.max_dev.408
  %t902 = call i64 @"sx_f64_gt"(i64 %t900, i64 %t901)
  %t903 = icmp ne i64 %t902, 0
  br i1 %t903, label %then54, label %else54
then54:
  %t904 = load i64, ptr %local.dev.412
  store i64 %t904, ptr %local.max_dev.408
  br label %then54_end
then54_end:
  br label %endif54
else54:
  br label %else54_end
else54_end:
  br label %endif54
endif54:
  %t905 = phi i64 [ 0, %then54_end ], [ 0, %else54_end ]
  %t906 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.139)
  %t907 = ptrtoint ptr %t906 to i64
  %t908 = inttoptr i64 %t907 to ptr
  call void @intrinsic_print(ptr %t908)
  %t909 = load i64, ptr %local.test_omega.410
  %t910 = call i64 @"print_f64"(i64 %t909)
  %t911 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.140)
  %t912 = ptrtoint ptr %t911 to i64
  %t913 = inttoptr i64 %t912 to ptr
  call void @intrinsic_print(ptr %t913)
  %t914 = load i64, ptr %local.r.411
  %t915 = call i64 @"print_f64"(i64 %t914)
  %t916 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.141)
  %t917 = ptrtoint ptr %t916 to i64
  %t918 = inttoptr i64 %t917 to ptr
  call void @intrinsic_print(ptr %t918)
  %t919 = load i64, ptr %local.dev.412
  %t920 = call i64 @"print_f64"(i64 %t919)
  %t921 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.142)
  %t922 = ptrtoint ptr %t921 to i64
  %t923 = inttoptr i64 %t922 to ptr
  call void @intrinsic_println(ptr %t923)
  %t924 = load i64, ptr %local.test_idx.409
  %t925 = add i64 %t924, 1
  store i64 %t925, ptr %local.test_idx.409
  br label %loop45
endloop45:
  %t926 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.143)
  %t927 = ptrtoint ptr %t926 to i64
  %t928 = inttoptr i64 %t927 to ptr
  call void @intrinsic_println(ptr %t928)
  %t929 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.144)
  %t930 = ptrtoint ptr %t929 to i64
  %t931 = inttoptr i64 %t930 to ptr
  call void @intrinsic_print(ptr %t931)
  %t932 = load i64, ptr %local.max_dev.408
  %t933 = call i64 @"print_f64"(i64 %t932)
  %t934 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.145)
  %t935 = ptrtoint ptr %t934 to i64
  %t936 = inttoptr i64 %t935 to ptr
  call void @intrinsic_println(ptr %t936)
  %t937 = load i64, ptr %local.max_dev.408
  %t938 = call i64 @f64_parse(ptr @.str.exp_ns_bootstrap.146)
  %t939 = call i64 @"sx_f64_lt"(i64 %t937, i64 %t938)
  %t940 = icmp ne i64 %t939, 0
  br i1 %t940, label %then55, label %else55
then55:
  %t941 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.147)
  %t942 = ptrtoint ptr %t941 to i64
  %t943 = inttoptr i64 %t942 to ptr
  call void @intrinsic_println(ptr %t943)
  %t944 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.148)
  %t945 = ptrtoint ptr %t944 to i64
  %t946 = inttoptr i64 %t945 to ptr
  call void @intrinsic_println(ptr %t946)
  %t947 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.149)
  %t948 = ptrtoint ptr %t947 to i64
  %t949 = inttoptr i64 %t948 to ptr
  call void @intrinsic_println(ptr %t949)
  %t950 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.150)
  %t951 = ptrtoint ptr %t950 to i64
  %t952 = inttoptr i64 %t951 to ptr
  call void @intrinsic_println(ptr %t952)
  %t953 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.151)
  %t954 = ptrtoint ptr %t953 to i64
  %t955 = inttoptr i64 %t954 to ptr
  call void @intrinsic_println(ptr %t955)
  %t956 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.152)
  %t957 = ptrtoint ptr %t956 to i64
  %t958 = inttoptr i64 %t957 to ptr
  call void @intrinsic_println(ptr %t958)
  %t959 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.153)
  %t960 = ptrtoint ptr %t959 to i64
  %t961 = inttoptr i64 %t960 to ptr
  call void @intrinsic_println(ptr %t961)
  br label %then55_end
then55_end:
  br label %endif55
else55:
  %t962 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.154)
  %t963 = ptrtoint ptr %t962 to i64
  %t964 = inttoptr i64 %t963 to ptr
  call void @intrinsic_println(ptr %t964)
  %t965 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.155)
  %t966 = ptrtoint ptr %t965 to i64
  %t967 = inttoptr i64 %t966 to ptr
  call void @intrinsic_println(ptr %t967)
  br label %else55_end
else55_end:
  br label %endif55
endif55:
  %t968 = phi i64 [ 0, %then55_end ], [ 0, %else55_end ]
  %t969 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.156)
  %t970 = ptrtoint ptr %t969 to i64
  %t971 = inttoptr i64 %t970 to ptr
  call void @intrinsic_println(ptr %t971)
  %t972 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.157)
  %t973 = ptrtoint ptr %t972 to i64
  %t974 = inttoptr i64 %t973 to ptr
  call void @intrinsic_println(ptr %t974)
  %t975 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.158)
  %t976 = ptrtoint ptr %t975 to i64
  %t977 = inttoptr i64 %t976 to ptr
  call void @intrinsic_println(ptr %t977)
  %t978 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.159)
  %t979 = ptrtoint ptr %t978 to i64
  %t980 = inttoptr i64 %t979 to ptr
  call void @intrinsic_println(ptr %t980)
  %t981 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.160)
  %t982 = ptrtoint ptr %t981 to i64
  %t983 = inttoptr i64 %t982 to ptr
  call void @intrinsic_println(ptr %t983)
  %t984 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.161)
  %t985 = ptrtoint ptr %t984 to i64
  %t986 = inttoptr i64 %t985 to ptr
  call void @intrinsic_println(ptr %t986)
  %t987 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.162)
  %t988 = ptrtoint ptr %t987 to i64
  %t989 = inttoptr i64 %t988 to ptr
  call void @intrinsic_println(ptr %t989)
  %t990 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.163)
  %t991 = ptrtoint ptr %t990 to i64
  %t992 = inttoptr i64 %t991 to ptr
  call void @intrinsic_println(ptr %t992)
  %t993 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.164)
  %t994 = ptrtoint ptr %t993 to i64
  %t995 = inttoptr i64 %t994 to ptr
  call void @intrinsic_println(ptr %t995)
  %t996 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_bootstrap.165)
  %t997 = ptrtoint ptr %t996 to i64
  %t998 = inttoptr i64 %t997 to ptr
  call void @intrinsic_println(ptr %t998)
  ret i64 0
}


; String constants
@.str.exp_ns_bootstrap.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_bootstrap.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_bootstrap.2 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_bootstrap.3 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_bootstrap.4 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_bootstrap.5 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_bootstrap.6 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_bootstrap.7 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_bootstrap.8 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_bootstrap.9 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_bootstrap.10 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_bootstrap.11 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_bootstrap.12 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_bootstrap.13 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_bootstrap.14 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_bootstrap.15 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_bootstrap.16 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_bootstrap.17 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_bootstrap.18 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_bootstrap.19 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_bootstrap.20 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_bootstrap.21 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_bootstrap.22 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_bootstrap.23 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_bootstrap.24 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_bootstrap.25 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_bootstrap.26 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_bootstrap.27 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_bootstrap.28 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_bootstrap.29 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_bootstrap.30 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ns_bootstrap.31 = private unnamed_addr constant [61 x i8] c"############################################################\00"
@.str.exp_ns_bootstrap.32 = private unnamed_addr constant [62 x i8] c"#  BOOTSTRAP: Self-Consistency Loop Contraction             #\00"
@.str.exp_ns_bootstrap.33 = private unnamed_addr constant [62 x i8] c"#                                                           #\00"
@.str.exp_ns_bootstrap.34 = private unnamed_addr constant [63 x i8] c"#  Map: Omega_max → Omega_max'                             #\00"
@.str.exp_ns_bootstrap.35 = private unnamed_addr constant [63 x i8] c"#  If Omega_max' / Omega_max < 1 → CONTRACTION             #\00"
@.str.exp_ns_bootstrap.36 = private unnamed_addr constant [65 x i8] c"#  Contraction → Banach fixed point → self-consistent      #\00"
@.str.exp_ns_bootstrap.37 = private unnamed_addr constant [63 x i8] c"#  enstrophy bound exists → regularity                     #\00"
@.str.exp_ns_bootstrap.38 = private unnamed_addr constant [62 x i8] c"#                                                           #\00"
@.str.exp_ns_bootstrap.39 = private unnamed_addr constant [61 x i8] c"#  This is the UAT (Theorem 1) applied to its own          #\00"
@.str.exp_ns_bootstrap.40 = private unnamed_addr constant [61 x i8] c"#  proof chain. The scaffold IS an adaptive subsystem.     #\00"
@.str.exp_ns_bootstrap.41 = private unnamed_addr constant [61 x i8] c"############################################################\00"
@.str.exp_ns_bootstrap.42 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_bootstrap.43 = private unnamed_addr constant [65 x i8] c"  === Phase 1: Contraction ratio vs Omega_max (N=6, nu=0.01) ===\00"
@.str.exp_ns_bootstrap.44 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_bootstrap.45 = private unnamed_addr constant [77 x i8] c"  Omega_max    Growth       Dissipation  Net Rate     Ratio        Contract?\00"
@.str.exp_ns_bootstrap.46 = private unnamed_addr constant [77 x i8] c"  ----------   ----------   ----------   ----------   ----------   ---------\00"
@.str.exp_ns_bootstrap.47 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_bootstrap.48 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_bootstrap.49 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_bootstrap.50 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_bootstrap.51 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_bootstrap.52 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ns_bootstrap.53 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_ns_bootstrap.54 = private unnamed_addr constant [5 x i8] c"20.0\00"
@.str.exp_ns_bootstrap.55 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_bootstrap.56 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_ns_bootstrap.57 = private unnamed_addr constant [6 x i8] c"200.0\00"
@.str.exp_ns_bootstrap.58 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_bootstrap.59 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_bootstrap.60 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_bootstrap.61 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_bootstrap.62 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_bootstrap.63 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_bootstrap.64 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_bootstrap.65 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_bootstrap.66 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_bootstrap.67 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_bootstrap.68 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_bootstrap.69 = private unnamed_addr constant [11 x i8] c"   YES ✓\00"
@.str.exp_ns_bootstrap.70 = private unnamed_addr constant [6 x i8] c"   NO\00"
@.str.exp_ns_bootstrap.71 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_bootstrap.72 = private unnamed_addr constant [68 x i8] c"  === Phase 2: Contraction ratio vs N (Omega_max=10.0, nu=0.01) ===\00"
@.str.exp_ns_bootstrap.73 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_bootstrap.74 = private unnamed_addr constant [32 x i8] c"  N      Ratio        Contract?\00"
@.str.exp_ns_bootstrap.75 = private unnamed_addr constant [32 x i8] c"  ----   ----------   ---------\00"
@.str.exp_ns_bootstrap.76 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_ns_bootstrap.77 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_bootstrap.78 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_bootstrap.79 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_bootstrap.80 = private unnamed_addr constant [11 x i8] c"   YES ✓\00"
@.str.exp_ns_bootstrap.81 = private unnamed_addr constant [6 x i8] c"   NO\00"
@.str.exp_ns_bootstrap.82 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_bootstrap.83 = private unnamed_addr constant [54 x i8] c"  === Phase 3: Bootstrap iteration (N=6, nu=0.01) ===\00"
@.str.exp_ns_bootstrap.84 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_bootstrap.85 = private unnamed_addr constant [52 x i8] c"  Starting from Omega_max = 100.0, iterate the map:\00"
@.str.exp_ns_bootstrap.86 = private unnamed_addr constant [32 x i8] c"  Omega' = Omega * ratio(Omega)\00"
@.str.exp_ns_bootstrap.87 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_bootstrap.88 = private unnamed_addr constant [52 x i8] c"  Iter     Omega_max      Ratio          Converged?\00"
@.str.exp_ns_bootstrap.89 = private unnamed_addr constant [52 x i8] c"  ----     ----------     ----------     ----------\00"
@.str.exp_ns_bootstrap.90 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_ns_bootstrap.91 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_bootstrap.92 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_bootstrap.93 = private unnamed_addr constant [6 x i8] c"     \00"
@.str.exp_ns_bootstrap.94 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_bootstrap.95 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_bootstrap.96 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_bootstrap.97 = private unnamed_addr constant [9 x i8] c"0.000001\00"
@.str.exp_ns_bootstrap.98 = private unnamed_addr constant [17 x i8] c"   CONVERGED ✓\00"
@.str.exp_ns_bootstrap.99 = private unnamed_addr constant [15 x i8] c"   contracting\00"
@.str.exp_ns_bootstrap.100 = private unnamed_addr constant [28 x i8] c"   ratio < 0 (overshooting)\00"
@.str.exp_ns_bootstrap.101 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_bootstrap.102 = private unnamed_addr constant [19 x i8] c"   not contracting\00"
@.str.exp_ns_bootstrap.103 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_ns_bootstrap.104 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_bootstrap.105 = private unnamed_addr constant [29 x i8] c"  FIXED POINT: Omega_max* = \00"
@.str.exp_ns_bootstrap.106 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_bootstrap.107 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_bootstrap.108 = private unnamed_addr constant [56 x i8] c"  The self-consistency loop CONTRACTS to a fixed point.\00"
@.str.exp_ns_bootstrap.109 = private unnamed_addr constant [14 x i8] c"  This means:\00"
@.str.exp_ns_bootstrap.110 = private unnamed_addr constant [48 x i8] c"    1. A self-consistent enstrophy bound EXISTS\00"
@.str.exp_ns_bootstrap.111 = private unnamed_addr constant [57 x i8] c"    2. The bound is STABLE (perturbations contract back)\00"
@.str.exp_ns_bootstrap.112 = private unnamed_addr constant [45 x i8] c"    3. Below this bound, the spectrum decays\00"
@.str.exp_ns_bootstrap.113 = private unnamed_addr constant [53 x i8] c"    4. The decaying spectrum ensures forward cascade\00"
@.str.exp_ns_bootstrap.114 = private unnamed_addr constant [51 x i8] c"    5. Forward cascade prevents low-k accumulation\00"
@.str.exp_ns_bootstrap.115 = private unnamed_addr constant [58 x i8] c"    6. Therefore enstrophy remains bounded → REGULARITY\00"
@.str.exp_ns_bootstrap.116 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_bootstrap.117 = private unnamed_addr constant [53 x i8] c"  By the Banach fixed-point theorem (UAT Theorem 1),\00"
@.str.exp_ns_bootstrap.118 = private unnamed_addr constant [50 x i8] c"  the contraction of the bootstrap map guarantees\00"
@.str.exp_ns_bootstrap.119 = private unnamed_addr constant [57 x i8] c"  existence and uniqueness of the self-consistent bound.\00"
@.str.exp_ns_bootstrap.120 = private unnamed_addr constant [47 x i8] c"  Bootstrap did NOT converge in 20 iterations.\00"
@.str.exp_ns_bootstrap.121 = private unnamed_addr constant [56 x i8] c"  The self-consistency loop may not contract at this N.\00"
@.str.exp_ns_bootstrap.122 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_bootstrap.123 = private unnamed_addr constant [57 x i8] c"  === Phase 4: Contraction rate (Lipschitz constant) ===\00"
@.str.exp_ns_bootstrap.124 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_bootstrap.125 = private unnamed_addr constant [51 x i8] c"  L = sup |ratio(Omega) - 1| over the tested range\00"
@.str.exp_ns_bootstrap.126 = private unnamed_addr constant [58 x i8] c"  If L < 1, the map is a contraction by Banach's theorem.\00"
@.str.exp_ns_bootstrap.127 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_bootstrap.128 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_bootstrap.129 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_bootstrap.130 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_bootstrap.131 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_bootstrap.132 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_bootstrap.133 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_ns_bootstrap.134 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_ns_bootstrap.135 = private unnamed_addr constant [5 x i8] c"20.0\00"
@.str.exp_ns_bootstrap.136 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_ns_bootstrap.137 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_ns_bootstrap.138 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_bootstrap.139 = private unnamed_addr constant [9 x i8] c"  Omega=\00"
@.str.exp_ns_bootstrap.140 = private unnamed_addr constant [9 x i8] c"  ratio=\00"
@.str.exp_ns_bootstrap.141 = private unnamed_addr constant [13 x i8] c"  |ratio-1|=\00"
@.str.exp_ns_bootstrap.142 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_bootstrap.143 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_bootstrap.144 = private unnamed_addr constant [21 x i8] c"  Max |ratio - 1| = \00"
@.str.exp_ns_bootstrap.145 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_bootstrap.146 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_bootstrap.147 = private unnamed_addr constant [56 x i8] c"  Lipschitz constant L < 1 → MAP IS A CONTRACTION ✓\00"
@.str.exp_ns_bootstrap.148 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_bootstrap.149 = private unnamed_addr constant [35 x i8] c"  By Banach's fixed-point theorem:\00"
@.str.exp_ns_bootstrap.150 = private unnamed_addr constant [47 x i8] c"    The bootstrap map has a UNIQUE fixed point\00"
@.str.exp_ns_bootstrap.151 = private unnamed_addr constant [42 x i8] c"    All initial conditions converge to it\00"
@.str.exp_ns_bootstrap.152 = private unnamed_addr constant [37 x i8] c"    The self-consistency loop CLOSES\00"
@.str.exp_ns_bootstrap.153 = private unnamed_addr constant [55 x i8] c"    Enstrophy is bounded → BKM finite → REGULARITY\00"
@.str.exp_ns_bootstrap.154 = private unnamed_addr constant [59 x i8] c"  Lipschitz constant L >= 1 → not a contraction globally\00"
@.str.exp_ns_bootstrap.155 = private unnamed_addr constant [59 x i8] c"  May still contract locally (check Phase 1 for the basin)\00"
@.str.exp_ns_bootstrap.156 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_bootstrap.157 = private unnamed_addr constant [61 x i8] c"############################################################\00"
@.str.exp_ns_bootstrap.158 = private unnamed_addr constant [61 x i8] c"#  BOOTSTRAP COMPLETE                                      #\00"
@.str.exp_ns_bootstrap.159 = private unnamed_addr constant [61 x i8] c"#                                                          #\00"
@.str.exp_ns_bootstrap.160 = private unnamed_addr constant [61 x i8] c"#  If contraction confirmed:                               #\00"
@.str.exp_ns_bootstrap.161 = private unnamed_addr constant [61 x i8] c"#    The UAT's Theorem 1 applies to the NS scaffold        #\00"
@.str.exp_ns_bootstrap.162 = private unnamed_addr constant [62 x i8] c"#    The scaffold IS an adaptive subsystem                  #\00"
@.str.exp_ns_bootstrap.163 = private unnamed_addr constant [62 x i8] c"#    Its own convergence theory proves its own claim        #\00"
@.str.exp_ns_bootstrap.164 = private unnamed_addr constant [61 x i8] c"#    This is the recursive closure of the proof chain      #\00"
@.str.exp_ns_bootstrap.165 = private unnamed_addr constant [61 x i8] c"############################################################\00"
